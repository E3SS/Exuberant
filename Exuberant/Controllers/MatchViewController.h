//
//  MatchViewController.h
//  Exuberant
//
//  Created by TJ Barber on 7/24/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVLHaloMatch.h"

@interface MatchViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *gameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *mapImage;
@property (weak, nonatomic) IBOutlet UITableView *gamerTableView;
@property (strong, nonatomic) NVLHaloMatch *match;

@end
