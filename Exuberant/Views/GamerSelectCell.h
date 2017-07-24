//
//  GamerSelectCell.h
//  Exuberant
//
//  Created by TJ Barber on 7/19/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GamerSelectCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *gamerImageView;
@property (weak, nonatomic) IBOutlet UILabel *gamertagLabel;
@property (weak, nonatomic) IBOutlet UIButton *gamertagButton;

@end
