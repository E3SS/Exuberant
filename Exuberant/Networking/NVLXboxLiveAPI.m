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



- (NSMutableURLRequest *)getAuthorizedURLRequest:(NSString *)route withParameters:(NSDictionary *)parameters
{
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer]
                                    requestWithMethod:@"GET" URLString:route parameters:parameters error:nil];
    [request setValue:self.apiKey forHTTPHeaderField:@"x-api-key"];
    return request;
}

@end
