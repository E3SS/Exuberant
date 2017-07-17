//
//  HomeFeedDataSource.m
//  Exuberant
//
//  Created by TJ Barber on 6/27/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "HomeFeedDataSource.h"
#import "MatchFeedCell.h"
#import "MatchDataSource.h"
#import "MapDataSource.h"
#import "NVLHaloMatch.h"
#import "NVLPendingOperations.h"
#import "NVLMapImageDownloader.h"

@implementation HomeFeedDataSource

- (id)init
{
    self = [super init];
    if (self) {
        _pendingOperations = [[NVLPendingOperations alloc] init];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[MatchDataSource sharedInstance] numberOfMatches];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MatchFeedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"matchFeedCell" forIndexPath:indexPath];
    NVLHaloMatch *match = [[MatchDataSource sharedInstance] getMatch:indexPath.row];
    UIImage *mapImage = [[MapDataSource sharedInstance] getImageFromMapId: match.mapId];
    
    if (mapImage == nil) {
        [self downloadMapImageForMatch:match forIndexPath:indexPath];
    } else {
        [[cell mapImageView] setImage:mapImage];
    }

    [cell configure:match];
    return cell;
}

- (void)downloadMapImageForMatch:(NVLHaloMatch *)match forIndexPath:(NSIndexPath *)indexPath
{
    if ([[self.pendingOperations downloadsInProgress] objectForKey:indexPath]) {
        return;
    }
    
    NVLMapImageDownloader *imageDownloader = [[NVLMapImageDownloader alloc] initWithMapId: match.mapId];
    
    __weak HomeFeedDataSource *weakSelf = self;
    __weak NVLMapImageDownloader *weakImageDownloader = imageDownloader;
    
    imageDownloader.completionBlock = ^() {
        if ([weakImageDownloader isCancelled]) {
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^() {
            [[[weakSelf pendingOperations] downloadsInProgress] removeObjectForKey:indexPath];
            [[weakSelf tableView] reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        });
    };
    
    [[[self pendingOperations] downloadsInProgress] setObject:imageDownloader forKey:indexPath];
    [[[self pendingOperations] downloadOperations] addOperation:imageDownloader];
}

@end
