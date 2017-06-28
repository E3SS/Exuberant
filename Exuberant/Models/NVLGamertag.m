//
//  Gamertag.m
//  Exuberant
//
//  Created by TJ Barber on 6/26/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "NVLGamertag.h"
#import "NVLHaloApi.h"

@implementation NVLGamertag

- (id)initFromDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        _displayName = dict[@"Gamertag"];
        _xuid        = dict[@"id"];
        _imageURL    = dict[@"GameDisplayPicRaw"];
    }
    return self;
}

@end
