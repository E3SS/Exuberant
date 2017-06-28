//
//  MatchDataSource.m
//  Exuberant
//
//  Created by TJ Barber on 6/27/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "MatchDataSource.h"

@interface MatchDataSource ()
@property (strong, nonatomic) NSMutableArray *data;
@end

@implementation MatchDataSource

+(instancetype)sharedInstance
{
    static MatchDataSource *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MatchDataSource alloc] init];
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

- (void)addMatch:(NVLHaloMatch *)match
{
    [self.data addObject:match];
}

- (NVLHaloMatch *)getMatch:(NSInteger)index
{
    return [self.data objectAtIndex:index];
}

- (NSUInteger)numberOfMatches
{
    return [self.data count];
}

@end
