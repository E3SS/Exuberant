//
//  NVLHaloMap.m
//  Exuberant
//
//  Created by TJ Barber on 6/27/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "NVLHaloMap.h"

@implementation NVLHaloMap

- (id)initFromDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        _displayName = dict[@"name"];
        _mapDescription = dict[@"description"];
        _imageURL = dict[@"imageUrl"];
        _mapId = dict[@"id"];
        _contentId = dict[@"contentId"];
    }
    return self;
}

@end
