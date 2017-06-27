//
//  ViewController.m
//  Exuberant
//
//  Created by TJ Barber on 6/26/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "ViewController.h"
#import "NVLHaloApi.h"

@interface InitialViewController ()

@end

@implementation InitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [[NVLHaloApi sharedInstance] getArenaStats:@"TorpedoSkyline" completionHandler:^(id json, NSError *error) {
//        if (error) {
//            NSLog(@"Error: %@", error);
//            return;
//        }
//        
//        NSLog(@"Response: %@", json);
//    }];
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // If no followers and first load
    if (true) {
        [self performSegueWithIdentifier:@"segueToIntro" sender:self];
    } else {
        // We're experienced
        // [self performSegueWithIdentifier:@"segueToMain" sender:self];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
