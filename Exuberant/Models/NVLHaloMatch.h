//
//  NVLHaloMatch.h
//  Exuberant
//
//  Created by TJ Barber on 6/27/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVLGamertag.h"

@interface NVLHaloMatch : NSObject

@property (strong, nonatomic) NSString *matchId;
@property (strong, nonatomic) NSString *gameMode;
@property (strong, nonatomic) NSString *mapId;
@property (weak,   nonatomic) NVLGamertag *gamertag;

// Make a number property
@property (strong, nonatomic) NSString *totalKills;
@property (strong, nonatomic) NSString *totalDeaths;

// FIXME: - Implement game times
@property (strong, nonatomic) NSString *matchDuration;
@property (strong, nonatomic) NSString *matchCompletedDate;

- (id)initWithDictionary:(NSDictionary *)dict forGamertag:(NVLGamertag *)gamertag;

@end
