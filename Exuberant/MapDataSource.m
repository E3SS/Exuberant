//
//  MapDataSource.m
//  Exuberant
//
//  Created by TJ Barber on 6/27/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//
// PLEASE NOTE:
// This file will eventually be replaced by CoreData.
// This is here to act as a temporary data source.

#import "MapDataSource.h"

@interface MapDataSource ()

@property (strong, nonatomic) NSMutableDictionary *data;
@property (strong, nonatomic) NSMutableDictionary *mapImages;

@end

@implementation MapDataSource

+ (MapDataSource *)sharedInstance
{
    static MapDataSource *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MapDataSource alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        _data = [[NSMutableDictionary alloc] init];
        _mapImages = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)addMap:(NVLHaloMap *)map
{
    [self.data setValue:map forKey:[map mapId]];
}

- (NVLHaloMap *)getMap:(NSString *)mapId
{
    return [self.data objectForKey:mapId];
}

- (UIImage *)getImageFromMapId:(NSString *)mapId
{
    return [self.mapImages objectForKey:mapId];
}

- (void)addImage:(UIImage *)image forMapId:(NSString *)mapId
{
    [self.mapImages setObject:image forKey:mapId];
}

@end
