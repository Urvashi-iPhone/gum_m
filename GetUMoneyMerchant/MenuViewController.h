//
//  MenuViewController.h
//  YOGA
//
//  Created by Tecksky Techonologies on 1/2/17.
//  Copyright © 2017 Tecksky Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *profilePic;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *email;
@property (strong, nonatomic) IBOutlet UITextField *name_update;
@property (strong, nonatomic) IBOutlet UITextField *phone_update;
@property (strong, nonatomic) IBOutlet UIImageView *profile_update;

@end
