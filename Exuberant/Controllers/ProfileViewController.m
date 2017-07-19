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

@end
