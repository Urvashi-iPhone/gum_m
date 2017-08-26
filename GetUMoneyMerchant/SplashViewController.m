//
//  SplashViewController.m
//  MSETCL
//
//  Created by Tecksky Techonologies on 3/4/17.
//  Copyright © 2017 Tecksky Technologies. All rights reserved.
//

#import "SplashViewController.h"
#import <AFNetworking.h>
#import "Constant.h"
#import "AppMethod.h"
#import "SWRevealViewController.h"
#import "ProgressHUD.h"
#import "InfoViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "DefaultModel.h"
#import "UIView+Toast.h"
@interface SplashViewController ()<CLLocationManagerDelegate>
{
    NSDictionary *dic,*dicState;
    CLLocationManager *locationManager;
    DefaultModel *statemodel;
}
@end

@implementation SplashViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
        [self.navigationController.view removeGestureRecognizer:self.navigationController.interactivePopGestureRecognizer];
    self.navigationController.navigationBar.hidden =YES;
    
//    [self checkLocationServicesTurnedOn];
//    [self checkApplicationHasLocationServicesPermission];
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.requestAlwaysAuthorization;
    [locationManager startUpdatingLocation];
   
   //  [self defaultData];
   
    
   
}
//- (void) checkLocationServicesTurnedOn {
//    if (![CLLocationManager locationServicesEnabled]) {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"== Opps! =="
//                                                        message:@"'Location Services' need to be on."
//                                                       delegate:nil
//                                              cancelButtonTitle:@"OK"
//                                              otherButtonTitles:nil];
//        [alert show];
//    }
//}
//-(void) checkApplicationHasLocationServicesPermission
//{
//    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"== Opps! =="
//                                                        message:@"This application needs 'Location Services' to be turned on."
//                                                       delegate:nil
//                                              cancelButtonTitle:@"OK"
//                                              otherButtonTitles:nil];
//        [alert show];
//    }
//}
-(void)defaultData
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:API_ID forKey:@"api_id"];
    [dict setObject:APP_SECRET forKey:@"api_secret"];
    [dict setObject:WS_DEFAULT_API forKey:@"api_request"];
    
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
    [dict setObject:data forKey:@"data"];
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [ProgressHUD show:@"Please wait..."];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    [manager POST:BASE_URL parameters:dict progress:nil success:^(NSURLSessionDataTask *task, id responseObject)
     {
         dicState = responseObject;
         
         statemodel = [[DefaultModel alloc]initWithValue:dicState];
         
         
         if (statemodel.flag)
         {
              [self getLogin_data];
             
             NSInteger nextTime = statemodel.data.next_time;
             NSString *referalPer = statemodel.data.referral_percentage;
             
             [AppMethod setStringDefault:DEF_NEXTTIME :[NSString stringWithFormat:@"%d",nextTime]];
             [AppMethod setStringDefault:DEF_REFERAL_PERCENTAGE :referalPer];
             
         }else
         {
             [self.view makeToast:statemodel.result];
         }
         
         [ProgressHUD dismiss];
         
     } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         [self.view makeToast:@"Error"];
         [ProgressHUD dismiss];
     }];
    
    
}

//-(void)startUpdatingLocation
//
//{
//    locationManager.startUpdatingLocation;
//}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    float longitude = currentLocation.coordinate.longitude;
    float latitude = currentLocation.coordinate.latitude;
    
    [AppMethod setDoubleDefault:DEF_LATITUDE :latitude];
    [AppMethod setDoubleDefault:DEF_LONGITUDE :longitude];
    
   
    
    CLGeocoder *ceo = [[CLGeocoder alloc]init];
    CLLocation *loc = [[CLLocation alloc]initWithLatitude:latitude longitude:longitude];
    
    [ceo reverseGeocodeLocation: loc completionHandler:
     ^(NSArray *placemarks, NSError *error)
    {
         CLPlacemark *placemark = [placemarks objectAtIndex:0];
         NSLog(@"placemark %@",placemark);
         //String to hold address
         NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
         
         //         NSLog(@"addressDictionary %@", placemark.addressDictionary);
         //
         //         NSLog(@"placemark %@",placemark.region);
         //         NSLog(@"placemark %@",placemark.country);  // Give Country Name
         NSLog(@"placemark %@",placemark.locality); // Extract the city name
         //         NSLog(@"location %@",placemark.name);
         //         NSLog(@"location %@",placemark.ocean);
         //         NSLog(@"location %@",placemark.postalCode);
         //         NSLog(@"location %@",placemark.subLocality);
         //
         //         NSLog(@"location %@",placemark.location);
         //         //Print the location to console
         //         NSLog(@"I am currently at %@",locatedAt);
        
       
         
          [AppMethod setStringDefault:DEF_CURRENT_CITY :placemark.locality];
     
        [self defaultData];
         
     }];
    [locationManager stopUpdatingLocation];
    locationManager = nil;
}

-(void)getLogin_data
{
    
    if (![AppMethod getBoolDefault:DEF_PREFERENCE])
    {
        [AppMethod setBoolDefault:DEF_PREFERENCE :YES];
        
        InfoViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"InfoViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else
    {
        if ([AppMethod getBoolDefault:DEF_IS_LOGIN])
        {
            
            SWRevealViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SWRevealViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else
        {
            LoginViewController *vc = [self.storyboard  instantiateViewControllerWithIdentifier:@"LoginViewController"];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
    }
    
    
}



//-(void)clearData
//{
//    [AppMethod  setBoolDefault:DEF_IS_LOGIN : false];
//    [AppMethod  setStringDefault:DEF_DEFAULT_RESPONSE :@""];
//    [AppMethod  setStringDefault:DEF_USER_TOKEN :@""];
//    [AppMethod  setStringDefault:DEF_SAP_ID :@""];
//    [AppMethod  setIntegerDefault:DEF_USER_TYPE :-1];
//    [AppMethod  setIntegerDefault:DEF_ID :-1];
//    [AppMethod  setStringDefault:DEF_PASSWORD : @""];
//    [AppMethod  setStringDefault:DEF_USERNAME :@""];
//    [AppMethod  setStringDefault:DEF_EMAIL :@""];
//    [AppMethod  setStringDefault:DEF_MOBILE :@""];
//    [AppMethod  setStringDefault:DEF_AGENCI_NAME :@""];
//    [AppMethod  setStringDefault:DEF_ADDRESS :@""];
//    [AppMethod  setStringDefault:DEF_PINCODE :@""];
//    [AppMethod  setStringDefault:DEF_USER_PROFILE :@""];
//}
@end
