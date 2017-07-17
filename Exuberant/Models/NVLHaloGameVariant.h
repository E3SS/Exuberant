//
//  NVLHaloGameVariant.h
//  Exuberant
//
//  Created by TJ Barber on 7/14/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVLHaloGameVariant : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *iconURL;
@property (strong, nonatomic) NSString *variantId;
@property (strong, nonatomic) NSString *contentId;

- (id)initFromDictionary:(NSDictionary *)dict;

@end
