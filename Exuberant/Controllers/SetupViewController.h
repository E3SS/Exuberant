//
//  SetupViewController.h
//  Exuberant
//
//  Created by TJ Barber on 6/26/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GamerDataSource.h"

@interface SetupViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)submit:(id)sender;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) GamerDataSource *gamerDataSource;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

- (void)submitWithGamertag:(NSString *)gamertag;

@end
