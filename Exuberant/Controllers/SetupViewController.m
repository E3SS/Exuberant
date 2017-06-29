//
//  SetupViewController.m
//  Exuberant
//
//  Created by TJ Barber on 6/26/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "SetupViewController.h"
#import "NVLXboxLiveAPI.h"
#import "NVLHaloApi.h"
#import "NVLGamertag.h"

// Replace with CoreData
#import "GamerDataSource.h"

@interface SetupViewController ()
@property (strong, nonatomic) NVLGamertag *gamertag;
@end

@implementation SetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(id)sender {
    NSString *gamertag = [self.textField text];
    [[NVLXboxLiveAPI sharedInstance] getGamerTagProfile:gamertag completionHandler:^(NSDictionary *json, NSError *error) {
        if (error) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil ];
            [alert addAction:alertAction];
            
            [self presentViewController:alert animated:YES completion:nil];
            return;
        }
        
        NVLGamertag *gamertag = [[NVLGamertag alloc] initFromDictionary:json];
        [[GamerDataSource sharedInstance] addGamertag:gamertag completionHandler:^() {
            [self performSegueWithIdentifier:@"segueToMainFromSetup" sender:self];
        }];
    }];
}
@end
