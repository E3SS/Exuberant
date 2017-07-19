//
//  Gamertag.h
//  Exuberant
//
//  Created by TJ Barber on 6/26/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NVLGamertag : NSObject

@property (strong, nonatomic) NSString *displayName;
@property (strong, nonatomic) NSString *xuid;
@property (strong, nonatomic) NSString *imageURL;
@property (strong, nonatomic) NSMutableArray *matches;
@property (nonatomic) BOOL isEndUsersProfile;
@property (strong, nonatomic) UIImage *spartanImage;
@property (strong, nonatomic) UIImage *emblemImage;

- (id)initFromDictionary:(NSDictionary *)dict;

@end
