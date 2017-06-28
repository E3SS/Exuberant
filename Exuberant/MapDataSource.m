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

@end
