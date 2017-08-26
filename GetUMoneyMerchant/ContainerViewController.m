//
//  ContainerViewController.m
//  Just Reminder
//
//  Created by Tecksky Techonologies on 12/15/16.
//  Copyright © 2016 Softranz Technologies. All rights reserved.
//

#import "ContainerViewController.h"

@interface ContainerViewController ()

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self segueIdentifierReceivedFromParent:@"Home"];
    // Do any additional setup after loading the view.
}



-(void)segueIdentifierReceivedFromParent:(NSString*)button{
    
    if ([button  isEqual: @"Home"])
    {
        self.segueIdentifier = @"Home";
        [self performSegueWithIdentifier:self.segueIdentifier sender:nil];
        
    }
    else if ([button  isEqual: @"SHOPPING"]){
        
        
        self.segueIdentifier = @"SHOPPING";
        [self performSegueWithIdentifier:self.segueIdentifier sender:nil];
    }

    else if ([button  isEqual: @"RECHARGE"]){
        
        
        self.segueIdentifier = @"RECHARGE";
        [self performSegueWithIdentifier:self.segueIdentifier sender:nil];
    }
    else if ([button  isEqual: @"RESTAURANT"]){
        
        
        self.segueIdentifier = @"RESTAURANT";
        [self performSegueWithIdentifier:self.segueIdentifier sender:nil];
    }
    else if ([button  isEqual: @"PATHLAB"]){
        
        
        self.segueIdentifier = @"PATHLAB";
        [self performSegueWithIdentifier:self.segueIdentifier sender:nil];
    }
       
    else if ([button  isEqual: @"OtherGym"]){
        
        
        self.segueIdentifier = @"OtherGym";
        [self performSegueWithIdentifier:self.segueIdentifier sender:nil];
    }
    else if ([button  isEqual: @"REFER FRIEND"]){
        
        
        self.segueIdentifier = @"REFER FRIEND";
        [self performSegueWithIdentifier:self.segueIdentifier sender:nil];
    }

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UIViewController  *lastViewController, *vc;
    //  vc = [[UIViewController alloc]init];
    // Make sure your segue name in storyboard is the same as this line
    
    if ([[segue identifier] isEqual: self.segueIdentifier]){
        if(lastViewController != nil){
            [lastViewController.view removeFromSuperview];
            
            
        }
        
        
        // Get reference to the destination view controller
        vc = (UIViewController *)[segue destinationViewController];
        [self addChildViewController:(vc)];
        
        
        vc. view.frame  = CGRectMake(0,0, self.view.frame.size.width , self.view.frame.size.height);
        
        [self.view addSubview:vc.view];
        lastViewController = vc;
        // Pass any objects to the view controller here, like...
        
    }
}




@end
