//
//  MenuViewController.m
//  YOGA
//
//  Created by Tecksky Techonologies on 1/2/17.
//  Copyright © 2017 Tecksky Technologies. All rights reserved.
//

#import "MenuViewController.h"
#import "SWRevealViewController.h"
#import "ViewController.h"
#import "AppMethod.h"
#import "Constant.h"
#import "KOPopupView.h"
#import "LoginModel.h"
#import <AFNetworking.h>
#import "UIView+Toast.h"
#import "LoginViewController.h"
#import "ImageLoader.h"
#import "UIImageView+ImageLoader.h"
#import "WeeklyBlastViewController.h"
#import "NotificationViewController.h"
#import "PromoCodeViewController.h"
#import "HelpViewController.h"
#import "MyAccountViewController.h"
#import "ReferFriendViewController.h"
#import "ContactUsViewController.h"
@interface MenuViewController ()
{
    NSString *oldPass,*newPass,*name,*phone;
    NSMutableDictionary *setdic;
    NSDictionary *dic;
    IBOutlet UILabel *weeklyLbl;
}

@property (strong, nonatomic) IBOutlet UIScrollView *scrlView;

//myaccount
@property (strong, nonatomic) IBOutlet UIButton *myAcBtn;
@property (strong, nonatomic) IBOutlet UILabel *myAcLbl;
@property (strong, nonatomic) IBOutlet UIImageView *myAcImg;

//refer friend

@property (strong, nonatomic) IBOutlet UIButton *referBtn;
@property (strong, nonatomic) IBOutlet UILabel *referLbl;
@property (strong, nonatomic) IBOutlet UIImageView *referImg;

//logout

@property (strong, nonatomic) IBOutlet UIButton *logoutBtn;
@property (strong, nonatomic) IBOutlet UILabel *logoutLbl;
@property (strong, nonatomic) IBOutlet UIImageView *logoutImg;
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    double screenHeight = [[UIScreen mainScreen] bounds].size.height;
//    if(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)
//    {
//        NSLog(@"All iPads");
//    } else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone)
//    {
//        if(screenHeight == 480) {
//            NSLog(@"iPhone 4/4S");
//            
//           weeklyLbl.font=[weeklyLbl.font fontWithSize:14];
//      
//            
//            //smallFonts = true;
//        } else if (screenHeight == 568)
//        {
//            NSLog(@"iPhone 5/5S/SE");
//           weeklyLbl.font=[weeklyLbl.font fontWithSize:14];
//            
//        } else if (screenHeight == 667)
//        {
//            NSLog(@"iPhone 6/6S");
//              weeklyLbl.font=[weeklyLbl.font fontWithSize:14];
//        } else if (screenHeight == 736)
//        {
//            NSLog(@"iPhone 6+, 6S+");
//              weeklyLbl.font=[weeklyLbl.font fontWithSize:14];
//        } else
//        {
//            NSLog(@"Others");
//              weeklyLbl.font=[weeklyLbl.font fontWithSize:17];
//        }
//
//    }
    if (![AppMethod chkLogin])
    {
        _name.text = @"Hi Guest";
        _email.text = @"Tap to Login";
        
        UITapGestureRecognizer *view_uploadTap =
        [[UITapGestureRecognizer alloc] initWithTarget:self
                                                action:@selector(Email_Tap:)];
        
        view_uploadTap.numberOfTapsRequired = 1;
        [view_uploadTap setDelegate:self];
        _email.userInteractionEnabled = YES;
        [_email addGestureRecognizer:view_uploadTap];
        
        _email.backgroundColor = [UIColor darkGrayColor];
        _email.layer.cornerRadius = 10.0f;
        _email.layer.masksToBounds = true;
        _profilePic.image = [UIImage imageNamed:@"icon_user.png"];
        
        _logoutBtn.hidden = YES;
          _logoutImg.hidden = YES;
          _logoutLbl.hidden = YES;
        
    }
    else
    {
        _name.text = [AppMethod getStringDefault:DEF_MEM_NAME];
        _email.text = [AppMethod getStringDefault:DEF_EMAIL];
        _name_update.text = [AppMethod getStringDefault:DEF_EMAIL];
        _phone_update.text = [AppMethod getStringDefault:DEF_MOBILE];
        
        [_profilePic il_setImageWithURL:[NSURL URLWithString:[AppMethod getStringDefault:DEF_PROFILE_PICTURE]] placeholderImage:[UIImage imageNamed:@"placeholder.png"] completion:^(BOOL finished)
         {
             NSLog(@"%ld, finished %d", (long)index, finished);
         }];
        _logoutBtn.hidden = NO;
        _logoutImg.hidden = NO;
        _logoutLbl.hidden = NO;
        
            _profilePic.layer.masksToBounds = true;
            _profilePic.layer.cornerRadius = _profilePic.layer.frame.size.height/2;
        
            _profilePic.layer.borderColor = [[UIColor blackColor] CGColor];
            _profilePic.layer.borderWidth = 1.0f;
    }

    

    
    //    CGRect contentRect = CGRectZero;
    //    for (UIView *view in self.scrlView.subviews)
    //    {
    //        contentRect = CGRectUnion(contentRect, view.frame);
    //    }
    //    self.scrlView.contentSize = contentRect.size;
    
    SWRevealViewController *revealController = [self revealViewController];
    [revealController tapGestureRecognizer];
    [revealController panGestureRecognizer];
    
}
- (void)Email_Tap: (id)sender
{
    [self gotoLoginPage];
}

-(void)gotoLoginPage
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"GetUMoney" message:@"You need to Sign Up to view this section" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Login" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        LoginViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    }];
    
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"Not now" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        
    }];
    [alert addAction:defaultAction];
     [alert addAction:cancleAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"home"])
    {
        ViewController *photoController = (ViewController*)segue.destinationViewController;
        
        photoController.btntag = 1;
    }
    //    else if ([segue.identifier isEqualToString:@"notification"])
    //    {
    //        ViewController *photoController = (ViewController*)segue.destinationViewController;
    //
    //        photoController.btntag = 2;
    //    }
    
    else if ([segue.identifier isEqualToString:@"referFriend"])
    {
        ViewController *photoController = (ViewController*)segue.destinationViewController;
        
        photoController.btntag = 4;
    }
    //    else if ([segue.identifier isEqualToString:@"weeklyBlast"])
    //    {
    //        ViewController *photoController = (ViewController*)segue.destinationViewController;
    //
    //        photoController.btntag = 5;
    //    }
    //
    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] )
    {
        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
        
        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
            
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[dvc] animated: NO ];
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        };
        
    }
}



- (IBAction)logoutBtn:(id)sender
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"GetUMoney"
                                                                   message:@"Are you sure you want to logout?"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              
                                                              NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
                                                              [defaults setObject:nil forKey:@"email_id"];
                                                              [defaults synchronize];
                                                              
                                                              
                                                              LoginViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
                                                              [AppMethod  setBoolDefault:DEF_IS_LOGIN : false];
                                                              [AppMethod  setStringDefault:DEF_EMAIL :@""];
                                                              [AppMethod  setStringDefault:DEF_MEM_NAME : @""];
                                                              [AppMethod  setStringDefault:DEF_MEM_ID :@""];
                                                              [AppMethod  setStringDefault:DEF_MOBILE :@""];
                                                              [AppMethod  setStringDefault:DEF_PASSWORD :@""];
                                                              [AppMethod  setStringDefault:DEF_POSTED :@""];
                                                              // [AppMethod  setStringDefault:DEF_REF_CODE :@""];
                                                              [AppMethod  setStringDefault:DEF_REF_ID :@""];
                                                              [AppMethod  setStringDefault:DEF_REF_PAID :@""];
                                                              [AppMethod  setStringDefault:DEF_STATUS :@""];
                                                              [self.navigationController pushViewController:vc animated:YES];
                                                          }];
    
    [alert addAction:defaultAction];
    
    UIAlertAction* cancleAction = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action)
                                   {
                                       
                                       SWRevealViewController *revealController = [self revealViewController];
                                       [revealController tapGestureRecognizer];
                                       [revealController panGestureRecognizer];
                                       SWRevealViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SWRevealViewController"];
                                       [self.navigationController pushViewController:vc animated:YES];
                                   }];
    [alert addAction:cancleAction];
    [self presentViewController:alert animated:YES completion:nil];
}
- (IBAction)weeklyblast:(id)sender {
    
    WeeklyBlastViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"WeeklyBlastViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (IBAction)notification:(id)sender {
    
    NotificationViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"NotificationViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)promocode:(id)sender
{
    if (![AppMethod chkLogin])
    {
        [self gotoLoginPage];
    }
    else
    {
    PromoCodeViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"PromoCodeViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    }
    
}
- (IBAction)helpBtn:(id)sender
{
    HelpViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"HelpViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (IBAction)myAccount:(id)sender
{
    if (![AppMethod chkLogin])
    {
        [self gotoLoginPage];
    }
    else
    {
    MyAccountViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MyAccountViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    }
    
}
- (IBAction)referfriend:(id)sender
{
    if (![AppMethod chkLogin])
    {
        [self gotoLoginPage];
    }
    else
    {
    ReferFriendViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ReferFriendViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    }
}
- (IBAction)contactUs:(id)sender
{
    ContactUsViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ContactUsViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)feedback:(id)sender {
    
    NSString *appName = [NSString stringWithString:[[[NSBundle mainBundle] infoDictionary]   objectForKey:@"CFBundleName"]];
    NSURL *appStoreURL = [NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.com/app/%@",[appName stringByReplacingOccurrencesOfString:@" " withString:@""]]];
    [[UIApplication sharedApplication] openURL:appStoreURL];
}
@end
