//
//  NVLHaloApi.m
//  Exuberant
//
//  Created by TJ Barber on 6/26/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "NVLHaloApi.h"
#import "AFNetworking/AFNetworking.h"

@implementation NVLHaloApi

typedef void (^CompletionHandler)(id json, NSError *error);

NSString *apiKey;

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
        apiKey = @"4826b671afa84fbbba1fdc512ab41fc1";
    }
    
    return self;
}

-(void)getArenaStats:(NSString *)gamertag completionHandler:(CompletionHandler)completionHandler
{

//    if (![self isNetworkConnected]) {
//        completionHandler(nil, [NSError errorWithDomain:NSErr code:<#(NSInteger)#> userInfo:<#(nullable NSDictionary *)#>])
//    }
    
    NSString *routeUrl = @"https://www.haloapi.com/stats/h5/servicerecords/arena";
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSMutableURLRequest *request = [self getAuthorizedURLRequest:routeUrl withParameters:@{@"players": gamertag}];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest: request completionHandler: ^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            completionHandler(nil, error);
        } else {
            completionHandler(responseObject, nil);
        }
    }];
    
    [dataTask resume];
}

-(NSMutableURLRequest *)getAuthorizedURLRequest:(NSString *)route withParameters:(NSDictionary *)parameters
{
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer]
                                    requestWithMethod:@"GET" URLString:route parameters:parameters error:nil];
    [request setValue:apiKey forHTTPHeaderField:@"Ocp-Apim-Subscription-Key"];
    return request;
}

-(BOOL)isNetworkConnected {
    return [[AFNetworkReachabilityManager sharedManager] isReachable];
}

@end
