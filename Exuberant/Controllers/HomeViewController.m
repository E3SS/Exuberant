//
//  FeedViewController.m
//  Exuberant
//
//  Created by TJ Barber on 6/27/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeFeedDataSource.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[HomeFeedDataSource alloc] init];
    self.tableView.dataSource = self.dataSource;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
