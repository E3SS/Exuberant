//
//  HomeFeedDataSource.h
//  Exuberant
//
//  Created by TJ Barber on 6/27/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVLPendingOperations.h"

@interface HomeFeedDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic) NVLPendingOperations *pendingOperations;
@property (strong, nonatomic) UITableView *tableView;

@end
