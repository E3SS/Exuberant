//
//  GamerDataSource.h
//  Exuberant
//
//  Created by TJ Barber on 6/27/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVLGamertag.h"

@interface GamerDataSource : NSObject

+(instancetype)sharedInstance;
- (void)addGamertag:(NVLGamertag *)gamertag;

@end
