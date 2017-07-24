//
//  ProfileViewController.h
//  Exuberant
//
//  Created by TJ Barber on 6/27/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *spartanImageView;
@property (weak, nonatomic) IBOutlet UIImageView *emblemImageView;

@property (weak, nonatomic) IBOutlet UILabel *gamertagLabel;
@property (weak, nonatomic) IBOutlet UILabel *spartanRankLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalKillsLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalAssistsLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalDeathsLabel;

@end
