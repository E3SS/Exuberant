//
//  MatchFeedCell.m
//  Exuberant
//
//  Created by TJ Barber on 6/27/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "MatchFeedCell.h"
#import "NVLHaloGameVariant.h"
#import "ExuberantEnums.h"
#import "MapDataSource.h"
#import "GameVariantDataSource.h"
#import "NVLGamertag.h"
#import "GamerDataSource.h"
#import "NVLExuberantAPI.h"
#import "PlaylistDataSource.h"

@implementation MatchFeedCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configure:(NVLHaloMatch *)match
{
    // clean up
    self.emblemImageView.image = nil;
    
    NSString *variantName = [[[GameVariantDataSource sharedInstance] getGameVariant:match.gameBaseVariantId] name];
    NSString *gamertag = match.queriedPlayer[@"gamertag"];
    
    NVLGamertag *gamerProfile = [[GamerDataSource sharedInstance] getGamertagProfile: gamertag];
    
    if (gamerProfile.emblemImage == nil) {
        [[NVLExuberantAPI sharedInstance] getEmblemImage:gamerProfile.displayName withSize:@"512" completion:^(UIImage *image, NSError *error) {
            gamerProfile.emblemImage = image;
            self.emblemImageView.image = gamerProfile.emblemImage;
        }];
    } else {
        self.emblemImageView.image = gamerProfile.emblemImage;
    }
    
    [self.gamertagLabel setText:gamerProfile.displayName];
    
    NSString *playlistName = [[[PlaylistDataSource sharedInstance] getPlaylist:match.playlistId] name];
    [self.playlistLabel setText:playlistName];
    
    NSString *mapName = [[[MapDataSource sharedInstance] getMap:match.mapId] displayName];
    NSString *matchLabelText = [NSString stringWithFormat:@"%@ on %@", variantName, mapName];
    [self.matchLabel setText:matchLabelText];
    
    NSNumber *result = [match.queriedPlayer objectForKey:@"Result"];
    switch ([result integerValue]) {
        case 0:
            // FIXME: - Remove did not finish matches
            [self.matchResultLabel setText:@"Did not finish"];
            break;
        case 1:
            [self.matchResultLabel setText:@"Loss"];
            break;
        case 2:
            [self.matchResultLabel setText:@"Tied"];
            break;
        case 3:
            [self.matchResultLabel setText:@"Win"];
            break;
    }

    NSString *killCount = [NSString stringWithFormat:@"%@", match.queriedPlayer[@"TotalKills"]];
    NSString *deathCount = [NSString stringWithFormat:@"%@", match.queriedPlayer[@"TotalDeaths"]];
    NSString *assistCount = [NSString stringWithFormat:@"%@", match.queriedPlayer[@"TotalAssists"]];
    
    [self.killCountLabel setText:killCount];
    [self.deathCountLabel setText:deathCount];
    [self.assistCountLabel setText:assistCount];
}

@end
