//
//  PlaylistDataSource.m
//  Exuberant
//
//  Created by TJ Barber on 7/18/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "PlaylistDataSource.h"
#import "NVLHaloPlaylist.h"

@interface PlaylistDataSource ()

@property (strong, nonatomic) NSMutableDictionary *data;

@end

@implementation PlaylistDataSource

+(instancetype)sharedInstance
{
    static PlaylistDataSource *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[PlaylistDataSource alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        _data = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)addPlaylist:(NVLHaloPlaylist *)playlist
{
    [self.data setObject:playlist forKey:playlist.playlistId];
}

- (NVLHaloPlaylist *)getPlaylist:(NSString *)playlistId
{
    return [self.data objectForKey:playlistId];
}

@end
