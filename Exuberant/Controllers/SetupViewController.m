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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"segueToMainFromSetup"]) {
        // Attach gamertag object to destination
    }
}


- (IBAction)submit:(id)sender {
    NSString *gamertag = [self.textField text];
    
    [[NVLXboxLiveAPI sharedInstance] getGamerTagProfile:gamertag completionHandler:^(NSDictionary *json, NSError *error) {
        if (error) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil ];
            [alert addAction:alertAction];
            
            [self presentViewController:alert animated:YES completion:nil];

        }
        
        // Add to data
        [self performSegueWithIdentifier:@"segueToMainFromSetup" sender:self];
    }];
}
@end
