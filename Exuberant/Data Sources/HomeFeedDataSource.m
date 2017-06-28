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
#import "NVLHaloMatch.h"

@implementation HomeFeedDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [[MatchDataSource sharedInstance] numberOfMatches];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MatchFeedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"matchFeedCell" forIndexPath:indexPath];
    
    NVLHaloMatch *match = [[MatchDataSource sharedInstance] getMatch:indexPath.row];
    [cell.matchLabel setText: [match matchId]];
    NSLog(@"I'm here");
    
    return cell;
}

@end
