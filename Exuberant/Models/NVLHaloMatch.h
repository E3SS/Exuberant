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
@property (strong, nonatomic) NSString *mapId;
@property (strong, nonatomic) NSString *mapVarient;
@property (strong, nonatomic) NSString *gameBaseVariantId;
@property (strong, nonatomic) NSString *gameVariant;
@property (nonatomic) BOOL isTeamGame;
@property (strong, nonatomic) NSDictionary *queriedPlayer;
@property (strong, nonatomic) NSString *seasonId;
@property (strong, nonatomic) NSString *playlistId;

- (id)initWithDictionary:(NSDictionary *)dict forGamertag:(NVLGamertag *)gamertag;

@end
