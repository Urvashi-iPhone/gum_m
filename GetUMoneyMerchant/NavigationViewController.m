//
//  NavigationViewController.m
//  Finance Teck
//
//  Created by Tecksky Techonologies on 4/25/17.
//  Copyright © 2017 Tecksky Technologies. All rights reserved.
//

#import "NavigationViewController.h"
#import "SWRevealViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.revealViewController.delegate = self;
  //  UINavigationBar.appearance.translucent = false;
  
}

//disable rear view all content
- (void)revealController:(SWRevealViewController *)revealController willMoveToPosition:(FrontViewPosition)position
{
    if(position == FrontViewPositionLeft)
    {
        self.view.userInteractionEnabled = YES;
    } else
    {
        self.view.userInteractionEnabled = NO;
    }
}

- (void)revealController:(SWRevealViewController *)revealController didMoveToPosition:(FrontViewPosition)position
{
    if(position == FrontViewPositionLeft)
    {
        self.view.userInteractionEnabled = YES;
    } else
    {
        self.view.userInteractionEnabled = NO;
    }
}

@end
