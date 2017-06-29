//
//  NVLHaloApi.m
//  Exuberant
//
//  Created by TJ Barber on 6/26/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "NVLHaloApi.h"
#import "AFNetworking/AFNetworking.h"

@interface NVLHaloApi ()

@property (strong, nonatomic) NSString *apiKey;
@property (strong, nonatomic) NSURLSessionConfiguration *configuration;
@property (strong, nonatomic) AFURLSessionManager *manager;

@end

@implementation NVLHaloApi

typedef void (^CompletionHandler)(id json, NSError *error);

+(NVLHaloApi *)sharedInstance
{
    static NVLHaloApi *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[NVLHaloApi alloc] init];
    });
    return sharedInstance;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.apiKey = @"4826b671afa84fbbba1fdc512ab41fc1";
        self.configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:_configuration];
    }
    
    return self;
}

-(void)getArenaServiceRecord:(NSString *)gamertag completionHandler:(CompletionHandler)completionHandler
{  
    NSString *routeUrl = @"https://exuberant-api.herokuapp.com/stats/servicerecord";
    NSMutableURLRequest *request = [self getAuthorizedURLRequest:routeUrl withParameters:@{@"players": gamertag}];
    
    NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest: request completionHandler: ^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            completionHandler(nil, error);
        } else {
            completionHandler(responseObject, nil);
        }
    }];
    
    [dataTask resume];
}

- (void)getPlayerMatchHistoryFor:(NSString *)player forMode:(NSString *)mode startIndex:(int)startIndex count:(int)count completionHandler:(CompletionHandler)completionHandler
{
    NSString *encodedGamertag = [player stringByAddingPercentEncodingWithAllowedCharacters: NSCharacterSet.URLPathAllowedCharacterSet];
    NSString *routeUrl = @"https://exuberant-api.herokuapp.com/stats/matches";
    NSMutableURLRequest *request = [self getAuthorizedURLRequest:routeUrl
                                                  withParameters:@{@"player": encodedGamertag,
                                                                   @"modes": mode,
                                                                   @"start": [NSString stringWithFormat:@"%i", startIndex],
                                                                   @"count": [NSString stringWithFormat:@"%i", count]}];
    NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest:request completionHandler: ^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            completionHandler(nil, error);
        } else {
            completionHandler(responseObject, nil);
        }
    }];
    
    [dataTask resume];
}

// MARK: - Halo Assets

- (void)getMaps:(CompletionHandler)completionHandler
{
    NSString *routeUrl = @"https://exuberant-api.herokuapp.com/metadata/maps";
    NSMutableURLRequest *request = [self getAuthorizedURLRequest:routeUrl withParameters:nil];
    
    NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            completionHandler(nil, error);
        } else {
            completionHandler(responseObject, nil);
        }
    }];
    
    [dataTask resume];
}

// MARK: - Helper methods

-(NSMutableURLRequest *)getAuthorizedURLRequest:(NSString *)route withParameters:(NSDictionary *)parameters
{
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer]
                                    requestWithMethod:@"GET" URLString:route parameters:parameters error:nil];
    [request setValue:self.apiKey forHTTPHeaderField:@"x-api-key"];
    return request;
}

-(BOOL)isNetworkConnected {
    return [[AFNetworkReachabilityManager sharedManager] isReachable];
}

@end
