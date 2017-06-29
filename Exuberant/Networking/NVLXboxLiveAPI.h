//
//  NVLXboxLiveAPI.h
//  Exuberant
//
//  Created by TJ Barber on 6/27/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVLXboxLiveAPI : NSObject
typedef void (^CompletionHandler)(id json, NSError *error);

+ (NVLXboxLiveAPI *)sharedInstance;

- (void)getGamerTagProfile:(NSString *)gamertag completionHandler:(CompletionHandler)completionHandler;

@end
