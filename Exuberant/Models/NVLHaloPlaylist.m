//
//  NVLHaloPlaylist.m
//  Exuberant
//
//  Created by TJ Barber on 7/18/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "NVLHaloPlaylist.h"

@implementation NVLHaloPlaylist

- (id)initFromDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        _name = [dict objectForKey:@"name"];
        _playlistDescription = [dict objectForKey:@"description"];
        _playlistId = [dict objectForKey:@"id"];
    }
    return self;
}

@end
