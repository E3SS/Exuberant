//
//  NVLXboxLiveAPI.m
//  Exuberant
//
//  Created by TJ Barber on 6/27/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "NVLXboxLiveAPI.h"
#import "AFNetworking/AFNetworking.h"

@interface NVLXboxLiveAPI ()

@property (strong, nonatomic) NSString *apiKey;
@property (strong, nonatomic) NSURLSessionConfiguration *configuration;
@property (strong, nonatomic) AFURLSessionManager *manager;

@end

@implementation NVLXboxLiveAPI

typedef void (^CompletionHandler)(id json, NSError *error);

+ (NVLXboxLiveAPI *)sharedInstance
{
    static NVLXboxLiveAPI *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[NVLXboxLiveAPI alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _apiKey = @"14e3935a4b916ef4d7ed6f9be186ea62b48a656d";
        _configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _manager = [[AFURLSessionManager alloc] initWithSessionConfiguration: _configuration];
    }
    
    return self;
}

- (void)getGamerTagProfile:(NSString *)gamertag completionHandler:(CompletionHandler)completionHandler
{
    
    NSString *encodedGamertag = [gamertag stringByAddingPercentEncodingWithAllowedCharacters: NSCharacterSet.URLPathAllowedCharacterSet];
    [self getGamertagXUID:encodedGamertag completionHandler:^(NSDictionary *json, NSError *error) {
        if (error) {
            completionHandler(nil, error);
        } else {
            NSString *routeURLWithXUID = [@"https://xboxapi.com/v2/" stringByAppendingString: json[@"xuid"]];
            NSString *routeURL = [routeURLWithXUID stringByAppendingString:@"/profile"];
            
            NSMutableURLRequest *request = [self getAuthorizedURLRequest:routeURL withParameters:nil];
            
            NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
                
                if (error) {
                    completionHandler(nil, error);
                } else {
                    completionHandler(responseObject, nil);
                }
            }];
            
            [dataTask resume];
        }
    }];
}

- (void)getGamertagXUID:(NSString *)gamertag completionHandler:(CompletionHandler)completionHandler
{
    NSString *routeURL = [@"https://xboxapi.com/v2/xuid/" stringByAppendingString:gamertag];

    NSMutableURLRequest *request = [self getAuthorizedURLRequest:routeURL withParameters:nil];
    
    NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            completionHandler(nil, error);
        } else {
            completionHandler(responseObject, nil);
        }
    }];
    
    [dataTask resume];
}

- (NSMutableURLRequest *)getAuthorizedURLRequest:(NSString *)route withParameters:(NSDictionary *)parameters
{
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer]
                                    requestWithMethod:@"GET" URLString:route parameters:parameters error:nil];
    [request setValue:self.apiKey forHTTPHeaderField:@"X-AUTH"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    return request;
}

@end
