//
//  Gamertag.m
//  Exuberant
//
//  Created by TJ Barber on 6/26/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "NVLGamertag.h"

@implementation NVLGamertag

- (id)initFromDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    if (self) {
        _displayName = dict[@"Gamertag"];
        _xuid        = dict[@"id"];
        _imageURL    = dict[@"GameDisplayPicRaw"];
        _matches     = [[NSMutableArray alloc] init];
        _isEndUsersProfile = NO;
        _spartanImage = nil;
        _emblemImage = nil;
    }
    
    return self;
}

@end
