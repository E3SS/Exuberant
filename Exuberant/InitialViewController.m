//
//  ViewController.m
//  Exuberant
//
//  Created by TJ Barber on 6/26/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "InitialViewController.h"
#import "NVLHaloApi.h"
#import "NVLHaloMap.h"
#import "MapDataSource.h"

@interface InitialViewController ()

@end

@implementation InitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Until we've setup core data we're going to hit everything we need to so we can setup the data
    // We don't want to be accessing the network this early anyway
    
    __block NSError *mapError;
    
    dispatch_group_t dataGroup = dispatch_group_create();
    
    dispatch_group_enter(dataGroup);
    [[NVLHaloApi sharedInstance] getMaps:^(NSArray *json, NSError *error) {
        if (error) {
            mapError = error;
            dispatch_group_leave(dataGroup);
            return;
        }
        
        for (int i = 0; i < [json count]; i++) {
            NVLHaloMap *map = [[NVLHaloMap alloc] initFromDictionary: [json objectAtIndex:i]];
            [[MapDataSource sharedInstance] addMap: map];
        }

        dispatch_group_leave(dataGroup);
    }];
    
    dispatch_group_notify(dataGroup, dispatch_get_main_queue(), ^(void) {
        // If no followers and first load
        // Need to check for errors on load
        if (true) {
            [self performSegueWithIdentifier:@"segueToIntro" sender:self];
        } else {
            // We're experienced
            // [self performSegueWithIdentifier:@"segueToMain" sender:self];
        }
    });
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
