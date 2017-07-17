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

@implementation MatchFeedCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configure:(NVLHaloMatch *)match
{
    NSString *variantName = [[[GameVariantDataSource sharedInstance] getGameVariant:match.gameBaseVariantId] name];
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
            [self.matchResultLabel setText:@"Tied"];
            break;
        case 2:
            [self.matchResultLabel setText:@"Loss"];
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
