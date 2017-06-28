//
//  NVLHaloApi.h
//  Exuberant
//
//  Created by TJ Barber on 6/26/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVLHaloApi : NSObject
typedef void (^CompletionHandler)(id json, NSError *error);

+ (NVLHaloApi *)sharedInstance;
- (void)getArenaServiceRecord:(NSString *)gamertag completionHandler:(CompletionHandler)completionHandler;
- (void)getMaps:(CompletionHandler)completionHandler;
- (void)getPlayerMatchHistoryFor:(NSString *)player forMode:(NSString *)mode startIndex:(int)startIndex count:(int)count completionHandler:(CompletionHandler)completionHandler;
- (BOOL)isNetworkConnected;

@end
