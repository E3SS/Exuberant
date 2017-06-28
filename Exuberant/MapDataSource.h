//
//  MapDataSource.h
//  Exuberant
//
//  Created by TJ Barber on 6/27/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVLHaloMap.h"

@interface MapDataSource : NSObject

+(instancetype)sharedInstance;
- (void)addMap:(NVLHaloMap *)map;
- (NVLHaloMap *)getMap:(NSString *)mapId;

@end
