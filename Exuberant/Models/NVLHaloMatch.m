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

- (id)initWithDictionary:(id)dict forGamertag:(NVLGamertag *)gamertag
{
    self = [super init];
    if (self) {
        NSDictionary *results = dict;
        
        _matchId = [results objectForKey:@"id"];
        _mapId = [results objectForKey:@"mapId"];
        _mapVarient = [results objectForKey:@"mapVariant"];
        _gameBaseVariantId = [results objectForKey:@"gameBaseVariantId"];
        _gameVariant = [results objectForKey:@"gameVariant"];
        _isTeamGame = [results objectForKey:@"isTeamGame"];
        _queriedPlayer = [results objectForKey:@"queriedPlayer"];
        _seasonId = [results objectForKey:@"seasonId"];
        _playlistId = [results objectForKey:@"playlistId"];
    }
    return self;
}

@end
