//
//  NVLHaloGameVariant.m
//  Exuberant
//
//  Created by TJ Barber on 7/14/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "NVLHaloGameVariant.h"

@implementation NVLHaloGameVariant

- (id)initFromDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    if (self) {
        _name = [dict objectForKey:@"name"];
        _iconURL = [dict objectForKey:@"iconUrl"];
        _variantId = [dict objectForKey:@"id"];
        _contentId = [dict objectForKey:@"contentId"];
    }
    
    return self;
}

@end
