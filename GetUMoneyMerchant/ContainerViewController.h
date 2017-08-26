//
//  ContainerViewController.h
//  Just Reminder
//
//  Created by Tecksky Techonologies on 12/15/16.
//  Copyright © 2016 Softranz Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContainerViewController : UIViewController
-(void)segueIdentifierReceivedFromParent:(NSString*)button;

@property NSString *segueIdentifier;
@property (nonatomic,assign) UIViewController* vc;

@end
