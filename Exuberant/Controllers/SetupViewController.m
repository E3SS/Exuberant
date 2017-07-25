//
//  SetupViewController.m
//  Exuberant
//
//  Created by TJ Barber on 6/26/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "SetupViewController.h"
#import "NVLExuberantAPI.h"
#import "NVLGamertag.h"

// Replace with CoreData
#import "GamerDataSource.h"
#import "GamerSelectCell.h"

@interface SetupViewController () 
@property (strong, nonatomic) NVLGamertag *gamertag;
@property (strong, nonatomic) NSArray *data;
@property (strong, nonatomic) NSString *providedGamertag;
@end

@implementation SetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.allowsSelection = YES;
    
    NSDictionary *vetoed = @{@"name": @"Vetoed", @"image": [UIImage imageNamed:@"vetoed"]};
    NSDictionary *torpedoSkyline = @{@"name": @"TorpedoSkyline", @"image": [UIImage imageNamed:@"torpedoskyline"]};
    NSDictionary *eli = @{@"name": @"Eli X", @"image": [UIImage imageNamed:@"eli_x"]};
    NSDictionary *contra = @{@"name": @"ContrA", @"image": [UIImage imageNamed:@"contra"]};
    NSDictionary *kampy = @{@"name": @"FaZe lKampy", @"image": [UIImage imageNamed:@"faze_kampy"]};
    NSDictionary *proximity = @{@"name": @"Proximitty Cx", @"image": [UIImage imageNamed:@"proximityce"]};
    
    self.data = @[vetoed, torpedoSkyline, eli, contra, kampy, proximity];
    
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(id)sender {
    NSString *gamertag = [self.textField text];
    [self submitWithGamertag:gamertag];
}

- (void)submitWithGamertag:(NSString *)gamertag
{
    self.collectionView.alpha = 0.2;
    self.textField.alpha = 0.2;
    
    [self.doneButton setEnabled:NO];
    self.doneButton.userInteractionEnabled = NO;
    
    [self.activityIndicator startAnimating];
    
    [[NVLExuberantAPI sharedInstance] getGamerTagProfile:gamertag completionHandler:^(id json, NSError *error) {
        if (error) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil ];
            [alert addAction:alertAction];
            
            [self presentViewController:alert animated:YES completion:nil];
            self.providedGamertag = nil;
            
            return;
        }
        
        NVLGamertag *gamertag = [[NVLGamertag alloc] initFromDictionary:json];
        
        // This is how we track who the end user is.
        gamertag.isEndUsersProfile = YES;
        [[GamerDataSource sharedInstance] addEndUserGamertag:gamertag];
        
        [[GamerDataSource sharedInstance] addGamertag:gamertag completionHandler:^() {
            
            [self performSegueWithIdentifier:@"segueToMainFromSetup" sender:self];
        }];
    }];
}

// MARK: UICollectionViewDelegate

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *selectedGamer = self.data[indexPath.row];
    [self submitWithGamertag:[selectedGamer objectForKey:@"name"]];
}

// MARK: UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.data.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GamerSelectCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"gamerCell" forIndexPath:indexPath];
    
    cell.gamerImageView.image = nil;
    
    NSDictionary *gamer = [self.data objectAtIndex:indexPath.row];
    cell.gamerImageView.image = [gamer objectForKey:@"image"];
    
    NSString *gamertag = [gamer objectForKey:@"name"];
    [cell.gamertagLabel setText:gamertag];
    
    return cell;
}

@end
