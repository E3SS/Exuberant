//
//  Gamertag.h
//  Exuberant
//
//  Created by TJ Barber on 6/26/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVLGamertag : NSObject

@property (strong, nonatomic) NSString *displayName;
@property (strong, nonatomic) NSString *xuid;
@property (strong, nonatomic) NSString *imageURL;
@property (strong, nonatomic) NSMutableArray *matches;

- (id)initFromDictionary:(NSDictionary *)dict;

@end
