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

@property (strong, nonatomic) NVLGamertag *endUser;

+(instancetype)sharedInstance;
- (void)addGamertag:(NVLGamertag *)gamertag completionHandler:(void (^)())completionHandler;
- (void)addEndUserGamertag:(NVLGamertag *)gamertag;
- (NVLGamertag *)getGamertagProfile:(NSString *)gamertagName;

@end
