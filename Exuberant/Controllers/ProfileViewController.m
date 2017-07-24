//
//  ProfileViewController.m
//  Exuberant
//
//  Created by TJ Barber on 6/27/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "ProfileViewController.h"
#import "NVLGamertag.h"
#import "NVLHaloServiceRecord.h"
#import "GamerDataSource.h"
#import "NVLExuberantAPI.h"

@interface ProfileViewController ()

@property (strong, nonatomic) NVLGamertag *profile;
@property (strong, nonatomic) NVLHaloServiceRecord *serviceRecord;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.profile == nil) {
        self.profile = [[GamerDataSource sharedInstance] endUser];
    }
    
    [self setBackgroundImages];
    [self loadServiceRecord];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setBackgroundImages
{
    [[NVLExuberantAPI sharedInstance] getSpartanImage:self.profile.displayName withSize:@"512" completion:^(UIImage *image, NSError *error) {
        self.spartanImageView.image = image;
    }];
    
    [[NVLExuberantAPI sharedInstance] getEmblemImage:self.profile.displayName withSize:@"512" completion:^(UIImage *image, NSError *error) {
        self.emblemImageView.image = image;
    }];
}

- (void)loadServiceRecord
{
    [[NVLExuberantAPI sharedInstance] getArenaServiceRecord:self.profile.displayName completionHandler:^(NSDictionary *json, NSError *error) {
        [self.gamertagLabel setText:self.profile.displayName];
        
        NSString *spartanRank = [NSString stringWithFormat:@"SR %@", json[@"Result"][@"SpartanRank"]];
        [self.spartanRankLabel setText:spartanRank];

        NSString *totalKills = [NSString stringWithFormat:@"%@", json[@"Result"][@"ArenaStats"][@"TotalKills"]];
        NSString *totalDeaths = [NSString stringWithFormat:@"%@", json[@"Result"][@"ArenaStats"][@"TotalDeaths"]];
        NSString *totalAssists = [NSString stringWithFormat:@"%@", json[@"Result"][@"ArenaStats"][@"TotalAssists"]];
        
        [self.totalKillsLabel setText:totalKills];
        [self.totalDeathsLabel setText:totalDeaths];
        [self.totalAssistsLabel setText:totalAssists];
    }];
}

@end
