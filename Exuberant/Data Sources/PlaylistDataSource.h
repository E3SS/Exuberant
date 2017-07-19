//
//  PlaylistDataSource.h
//  Exuberant
//
//  Created by TJ Barber on 7/18/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVLHaloPlaylist.h"

@interface PlaylistDataSource : NSObject

+(instancetype)sharedInstance;
- (void)addPlaylist:(NVLHaloPlaylist *)playlist;
- (NVLHaloPlaylist *)getPlaylist:(NSString *)playlistId;

@end
