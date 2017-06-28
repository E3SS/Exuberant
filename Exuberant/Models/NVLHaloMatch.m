//
//  NVLHaloMatch.m
//  Exuberant
//
//  Created by TJ Barber on 6/27/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "NVLHaloMatch.h"
#import "NVLGamertag.h"

@implementation NVLHaloMatch

- (id)initWithDictionary:(NSDictionary *)dict forGamertag:(NVLGamertag *)gamertag
{
    self = [super init];
    if (self) {
        // FIXME: - Add the rest of the data for a match
        _matchId = [[dict objectForKey:@"Id"] objectForKey:@"MatchId"];
        _gameMode = [[dict objectForKey:@"Id"] objectForKey:@"GameMode"];
        _mapId = [dict objectForKey:@"MapId"];
        _gamertag = gamertag;
    }
    return self;
}

@end
