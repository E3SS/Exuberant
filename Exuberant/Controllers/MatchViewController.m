//
//  MatchViewController.m
//  Exuberant
//
//  Created by TJ Barber on 7/24/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "MatchViewController.h"
#import "NVLExuberantAPI.h"
#import "NVLHaloMatch.h"
#import "NVLHaloMap.h"
#import "MatchDataSource.h"
#import "MapDataSource.h"
#import "GamerMatchDetailCell.h"
#import "GameVariantDataSource.h"

@interface MatchViewController ()

@end

@implementation MatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *mapImage = [[MapDataSource sharedInstance] getImageFromMapId:self.match.mapId];
    self.mapImage.image = mapImage;
    
    self.gamerTableView.dataSource = self;
    [self loadMatchData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadMatchData
{
    if ([self.match.playerData count] == 0) {
        [[NVLExuberantAPI sharedInstance] getMatchDataFor:self.match.matchId completionHandler:^(NSDictionary *data, NSError *error) {
            NSArray *playerStats = data[@"PlayerStats"];
            for (int i = 0; i < [playerStats count]; i++) {
                NSDictionary *playerData = [playerStats objectAtIndex:i];
                NSDictionary *player = playerData[@"Player"];
                NSDictionary *prunnedData = @{
                                              @"gamertag": player[@"Gamertag"]
                                              };
                
                [self.match.playerData addObject:prunnedData];
            }
            
            [self.gamerTableView reloadData];
        }];
    }
    
    NSString *variantName = [[[GameVariantDataSource sharedInstance] getGameVariant:self.match.gameBaseVariantId] name];
    NSString *mapName = [[[MapDataSource sharedInstance] getMap:self.match.mapId] displayName];
    NSString *matchLabelText = [NSString stringWithFormat:@"%@ on %@", variantName, mapName];
    [self.gameLabel setText:matchLabelText];
}

// MARK: - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48.0;
}

// MARK: - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.match.playerData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    GamerMatchDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"matchDetailGamertagCell" forIndexPath:indexPath];
    
    NSDictionary *playerData = [self.match.playerData objectAtIndex:indexPath.row];
    [cell.gamertagLabel setText: playerData[@"gamertag"]];
    
    return cell;
}

@end
