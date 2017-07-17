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
#import "NVLExuberantAPI.h"
#import "NVLHaloMatch.h"
#import "MatchDataSource.h"

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

- (void)addGamertag:(NVLGamertag *)gamertag completionHandler:(void (^)())completionHandler
{
    
    [[NVLExuberantAPI sharedInstance] getPlayerMatchHistoryFor:gamertag.displayName forMode:@"arena" startIndex:0 count:25 completionHandler:^(NSArray *json, NSError *error) {
        
        NSArray *results = json;
        
        for (int i = 0; i < [results count]; i++) {
            
            NVLHaloMatch *match = [[NVLHaloMatch alloc] initWithDictionary: [results objectAtIndex:i] forGamertag: gamertag];
            
            NSNumber *result = [match.queriedPlayer objectForKey:@"Result"];

            // Don't include games you quit out of
            if (result.integerValue != 0) {
                [[MatchDataSource sharedInstance] addMatch:match];
                [[gamertag matches] addObject:match];
            }
            
        }
        
        [self.data addObject:gamertag];
        
        completionHandler();
    }];
}

@end
