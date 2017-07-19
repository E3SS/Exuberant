//
//  NVLHaloPlaylist.h
//  Exuberant
//
//  Created by TJ Barber on 7/18/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVLHaloPlaylist : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *playlistDescription;
@property (strong, nonatomic) NSString *playlistId;

- (id)initFromDictionary:(NSDictionary *)dict;

@end
