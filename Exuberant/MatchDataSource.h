//
//  MatchDataSource.h
//  Exuberant
//
//  Created by TJ Barber on 6/27/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVLHaloMatch.h"

@interface MatchDataSource : NSObject

+(instancetype)sharedInstance;
- (void)addMatch:(NVLHaloMatch *)match;
- (NVLHaloMatch *)getMatch:(NSInteger)matchId;
- (NSUInteger)numberOfMatches;

@end
