//
//  GamerDataSource.m
//  Exuberant
//
//  Created by TJ Barber on 6/27/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//
// PLEASE NOTE:
// This file will eventually be replaced by CoreData.
// This is here to act as a temporary data source.

#import "GamerDataSource.h"

@interface GamerDataSource ()

@property (strong, nonatomic) NSMutableArray *data;

@end

@implementation GamerDataSource

+ (GamerDataSource *)sharedInstance
{
    static GamerDataSource *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[GamerDataSource alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        _data = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addGamertag:(NVLGamertag *)gamertag
{
    
    [self.data addObject:gamertag];
}

@end
