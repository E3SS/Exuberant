//
//  NVLPendingOperations.m
//  Exuberant
//
//  Created by TJ Barber on 6/28/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "NVLPendingOperations.h"

@implementation NVLPendingOperations

- (id)init
{
    self = [super init];
    if (self) {
        _downloadsInProgress = [[NSMutableDictionary alloc] init];
        _downloadOperations  = [[NSOperationQueue alloc] init];
    }
    return self;
}

@end
