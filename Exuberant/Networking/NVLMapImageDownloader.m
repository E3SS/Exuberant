//
//  NVLMapImageDownloader.m
//  Exuberant
//
//  Created by TJ Barber on 6/28/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "NVLMapImageDownloader.h"
#import "NVLHaloMap.h"
#import "MapDataSource.h"

@implementation NVLMapImageDownloader : NSOperation

- (id)initWithMapId:(NSString *)mapId
{
    self = [super init];
    if (self) {
        _mapId = mapId;
    }
    return self;
}

- (void)main
{
    if ([self isCancelled]) {
        return;
    }
    
    NVLHaloMap *currentMap = [[MapDataSource sharedInstance] getMap:self.mapId];
    if (currentMap == nil || [currentMap imageURL] == nil) {
        return;
    }
    
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[currentMap imageURL]]];
    
    if ([self isCancelled]) {
        return;
    }
    
    UIImage *image = [[UIImage alloc] initWithData:imageData];
    
    if (imageData.length > 0) {
        [[MapDataSource sharedInstance] addImage:image forMapId: self.mapId];
    }
}

@end
