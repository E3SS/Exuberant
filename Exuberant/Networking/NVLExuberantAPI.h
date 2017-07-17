//
//  NVLExuberantAPI.h
//  Exuberant
//
//  Created by TJ Barber on 7/14/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVLExuberantAPI : NSObject

typedef void (^CompletionHandler)(id json, NSError *error);

+ (instancetype)sharedInstance;
- (void)getGameBaseVariants:(CompletionHandler)completionHandler;
- (void)getMaps:(CompletionHandler)completionHandler;
-(void)getArenaServiceRecord:(NSString *)gamertag completionHandler:(CompletionHandler)completionHandler;
- (void)getPlayerMatchHistoryFor:(NSString *)player forMode:(NSString *)mode startIndex:(int)startIndex count:(int)count completionHandler:(CompletionHandler)completionHandler;
- (void)getGamerTagProfile:(NSString *)gamertag completionHandler:(CompletionHandler)completionHandler;


@end
