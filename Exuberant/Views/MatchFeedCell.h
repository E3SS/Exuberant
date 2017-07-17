//
//  MatchFeedCell.h
//  Exuberant
//
//  Created by TJ Barber on 6/27/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVLHaloMatch.h"

@interface MatchFeedCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *mapImageView;
@property (weak, nonatomic) IBOutlet UILabel *matchLabel;
@property (weak, nonatomic) IBOutlet UILabel *matchResultLabel;
@property (weak, nonatomic) IBOutlet UILabel *killCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *deathCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *assistCountLabel;

- (void)configure:(NVLHaloMatch *)match;

@end
