//
//  FeedViewController.h
//  Exuberant
//
//  Created by TJ Barber on 6/27/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeFeedDataSource.h"

@interface HomeViewController : UIViewController

@property (strong, nonatomic) HomeFeedDataSource *dataSource;

@end
