//
//  NVLHaloMap.h
//  Exuberant
//
//  Created by TJ Barber on 6/27/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVLHaloMap : NSObject

@property (strong, nonatomic) NSString *displayName;
@property (strong, nonatomic) NSString *mapDescription;
@property (strong, nonatomic) NSString *imageURL;
@property (strong, nonatomic) NSString *mapId;
@property (strong, nonatomic) NSString *contentId;

- (id)initFromDictionary:(NSDictionary *)dict;

@end
