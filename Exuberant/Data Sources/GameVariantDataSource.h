//
//  GameVariantDataSource.h
//  Exuberant
//
//  Created by TJ Barber on 7/14/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVLHaloGameVariant.h"

@interface GameVariantDataSource : NSObject

+(instancetype)sharedInstance;
- (void)addGameVariant:(NVLHaloGameVariant *)variant;
- (NVLHaloGameVariant *)getGameVariant:(NSString *)variantId;
- (NSUInteger)numberOfVariants;

@end
