//
//  FeedViewController.m
//  Exuberant
//
//  Created by TJ Barber on 6/27/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeFeedDataSource.h"
#import "MatchViewController.h"
#import "NVLHaloMatch.h"
#import "MatchDataSource.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [[HomeFeedDataSource alloc] init];
    self.dataSource.tableView = self.tableView;
    
    self.tableView.dataSource = self.dataSource;

    self.tableView.delegate = self;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    NSIndexPath *selectedRow = [self.tableView indexPathForSelectedRow];
    
    if (selectedRow != nil) {
        [self.tableView deselectRowAtIndexPath:selectedRow animated:NO];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 275.0;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqual: @"presentMatchData"]) {
        MatchViewController *destination = [segue destinationViewController];
        NSIndexPath *selectedRowIndexPath = [self.tableView indexPathForSelectedRow];
        NVLHaloMatch *match = [[MatchDataSource sharedInstance] getMatch: selectedRowIndexPath.row];
        destination.match = match;
    }
}

@end
