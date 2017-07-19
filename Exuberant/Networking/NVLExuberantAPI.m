//
//  NVLExuberantAPI.m
//  Exuberant
//
//  Created by TJ Barber on 7/14/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "NVLExuberantAPI.h"
#import <UIKit/UIKit.h>

@interface NVLExuberantAPI ()

@property (strong, nonatomic) NSURLSessionConfiguration *configuration;

@end

@implementation NVLExuberantAPI

typedef void (^CompletionHandler)(id json, NSError *error);
typedef void (^ImageCompletionHandler)(UIImage *image, NSError *error);

+ (instancetype)sharedInstance
{
    static NVLExuberantAPI *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[NVLExuberantAPI alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        _configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    }
    return self;
}

- (void)getGameBaseVariants:(CompletionHandler)completionHandler
{
    [self executeURLRequest:@"http://localhost:1337/h5/gamebasevariants" withParameters:nil withCompletion:^(id json, NSError *error) {
        if (error != nil) {
            completionHandler(nil, error);
        }
        
        completionHandler(json, nil);
    }];
}


- (void)getMaps:(CompletionHandler)completionHandler
{
    [self executeURLRequest:@"http://localhost:1337/h5/maps" withParameters:nil withCompletion:^(id json, NSError *error) {
        if (error != nil) {
            completionHandler(nil, error);
        }
        
        completionHandler(json, nil);
    }];
}

- (void)getPlaylists:(CompletionHandler)completionHandler
{
    [self executeURLRequest:@"http://localhost:1337/h5/playlists" withParameters:nil withCompletion:^(id json, NSError *error) {
        if (error != nil) {
            completionHandler(nil, error);
        }
        
        completionHandler(json, error);
    }];
}

-(void)getArenaServiceRecord:(NSString *)gamertag completionHandler:(CompletionHandler)completionHandler
{
    [self executeURLRequest:@"http://localhost:1337/h5/servicerecord" withParameters:@{@"players": gamertag} withCompletion:^(id json, NSError *error) {
        if (error != nil) {
            completionHandler(nil, error);
        }
        
        completionHandler(json, nil);
    }];
}

- (void)getPlayerMatchHistoryFor:(NSString *)player forMode:(NSString *)mode startIndex:(int)startIndex count:(int)count completionHandler:(CompletionHandler)completionHandler
{
    NSString *startIndexStr = [NSString stringWithFormat:@"%d", startIndex];
    NSString *countStr = [NSString stringWithFormat:@"%d", count];
    
    [self executeURLRequest:@"http://localhost:1337/h5/matches" withParameters:@{@"player": player, @"mode": mode, @"start": startIndexStr, @"count": countStr} withCompletion:^(id json, NSError *error) {
        if (error != nil) {
            completionHandler(nil, error);
        }
        
        NSArray *results = json;
        
        completionHandler(results, nil);
    }];
}

- (void)getGamerTagProfile:(NSString *)gamertag completionHandler:(CompletionHandler)completionHandler
{
    [self executeURLRequest:@"http://localhost:1337/xboxlive/profile" withParameters:@{@"gamertag": gamertag} withCompletion:^(id json, NSError *error) {
        if (error != nil) {
            completionHandler(nil, error);
        }
        
        completionHandler(json, nil);
    }];
}

- (void)getSpartanImage:(NSString *)gamertag withSize:(NSString *)size completion:(ImageCompletionHandler)completionHandler
{
    [self executeImageRequest:@"http://localhost:1337/h5/spartan" withParameters:@{@"player": gamertag, @"size": @"512"} withCompletion:^(UIImage *image, NSError *error) {
        if (error != nil) {
            completionHandler(nil, error);
        }
        
        completionHandler(image, nil);
    }];
}

- (void)getEmblemImage:(NSString *)gamertag withSize:(NSString *)size completion:(ImageCompletionHandler)completionHandler
{
    [self executeImageRequest:@"http://localhost:1337/h5/emblem" withParameters:@{@"player": gamertag, @"size": size} withCompletion:^(UIImage *image, NSError *error) {
        if (error != nil) {
            completionHandler(nil, error);
        }
        
        completionHandler(image, nil);
    }];
}

- (NSURL *)buildURLWith:(NSString *)urlStr andParameters:(NSDictionary *)parameters
{
    NSURLComponents *components = [NSURLComponents componentsWithString:urlStr];
    NSMutableArray *queryItems = [[NSMutableArray alloc] init];
    
    if (parameters != nil && parameters.allKeys.count > 0) {
        for (int i = 0; i < parameters.allKeys.count; i++) {
            NSString *key = [parameters.allKeys objectAtIndex:i];
            NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:key value:[parameters objectForKey:key]];
            [queryItems addObject:queryItem];
        }
    }
    
    components.queryItems = queryItems;
    
    return components.URL;
}

- (void)executeURLRequest:(NSString *)urlStr withParameters:(NSDictionary *)parameters withCompletion:(CompletionHandler)completion
{
    NSURLSession *session = [NSURLSession sessionWithConfiguration:self.configuration];
    NSURL *url = [self buildURLWith:urlStr andParameters:parameters];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, error);
            });
        }
        
        NSError *jsonParsingError = nil;
        id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(json, nil);
        });
        
    }] resume];

}

- (void)executeImageRequest:(NSString *)urlStr withParameters:(NSDictionary *)parameters withCompletion:(ImageCompletionHandler)completion
{
    NSURLSession *session = [NSURLSession sessionWithConfiguration:self.configuration];
    NSURL *url = [self buildURLWith:urlStr andParameters:parameters];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60];
    
    [[session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, error);
            });
            
        }
        
        NSData *imageData = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:imageData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(image, nil);
        });
    }] resume];
}

@end
