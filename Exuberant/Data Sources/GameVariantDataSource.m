//
//  GameVariantDataSource.m
//  Exuberant
//
//  Created by TJ Barber on 7/14/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "GameVariantDataSource.h"

@interface GameVariantDataSource ()

@property (strong, nonatomic) NSMutableDictionary *data;

@end

@implementation GameVariantDataSource

+(instancetype)sharedInstance
{
    static GameVariantDataSource *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[GameVariantDataSource alloc] init];
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

- (void)addGameVariant:(NVLHaloGameVariant *)variant
{
    [self.data setObject:variant forKey:variant.variantId];
}

- (NVLHaloGameVariant *)getGameVariant:(NSString *)variantId
{
    return [self.data objectForKey:variantId];
}

- (NSUInteger)numberOfVariants
{
    return [self.data count];
}

@end
