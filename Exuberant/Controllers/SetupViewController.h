//
//  SetupViewController.h
//  Exuberant
//
//  Created by TJ Barber on 6/26/17.
//  Copyright © 2017 TJ Barber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetupViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)submit:(id)sender;

@end
