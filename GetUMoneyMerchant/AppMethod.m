//
//  AppMethod.m
//  Runmileapp
//
//  Created by Tecksky Techonologies on 9/3/16.
//  Copyright © 2016 Tecksky Techonologies. All rights reserved.
//

#import "AppMethod.h"
#import "Reachability.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "LoginViewController.h"
#import "Constant.h"
@import Foundation;
@import MobileCoreServices;

@implementation AppMethod

+(void)setStringDefault:(NSString *)key :(NSString *)value
{
    [[NSUserDefaults standardUserDefaults]setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
}
+(NSString*)getStringDefault:(NSString *)key
{
    NSString *value=[[NSUserDefaults standardUserDefaults]stringForKey:key];
    return value;
}

+(void)setBoolDefault:(NSString *)key :(BOOL)value
{
    [[NSUserDefaults standardUserDefaults]setBool:value forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
}
+(BOOL)getBoolDefault:(NSString *)key
{
    BOOL value=[[NSUserDefaults standardUserDefaults]boolForKey:key];
    return value;
}

+(void)setIntegerDefault:(NSString *)key :(NSInteger)value
{
    [[NSUserDefaults standardUserDefaults]setInteger:value forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
}
+(NSInteger)getIntegerDefault:(NSString *)key
{
    BOOL value=[[NSUserDefaults standardUserDefaults]integerForKey:key];
    return value;
}

+(void)setDoubleDefault:(NSString *)key :(double)value
{
    [[NSUserDefaults standardUserDefaults]setDouble:value forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
}
+(double)getDoubleDefault:(NSString *)key
{
    double value=[[NSUserDefaults standardUserDefaults]doubleForKey:key];
    return value;
}

+(void)setDictionaryDefault:(NSString*)key:(NSDictionary*)value
{
    [[NSUserDefaults standardUserDefaults]setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

+(NSDictionary*)getDictionaryDefault:(NSString*)key
{
    NSDictionary *value=[[NSUserDefaults standardUserDefaults]objectForKey:key];
    return value;
}

//for address
+(NSString *)convertHTML:(NSString *)html
{
    html = [html stringByReplacingOccurrencesOfString:@"&#9724;" withString:@"\u2022"];
    NSScanner *myScanner;
    NSString *text = nil;
    myScanner = [NSScanner scannerWithString:html];
    
    while ([myScanner isAtEnd] == NO) {
        
        [myScanner scanUpToString:@"<" intoString:NULL] ;
        
        [myScanner scanUpToString:@">" intoString:&text] ;
        
       html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>", text] withString:@"\n"];
    }
    html = [html stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return html;
}


+(void)setArrayDefault:(NSMutableArray *)key :(NSMutableArray *)value
{
    [[NSUserDefaults standardUserDefaults]setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
+(NSMutableArray*)getArrayDefault:(NSMutableArray *)key
{
    NSMutableArray *value = [[NSUserDefaults standardUserDefaults]arrayForKey:key];
    return value;
}

+(NSInteger)Check_Internet;
{
    Reachability *IsReachable = [Reachability reachabilityForInternetConnection];
    NetworkStatus internetStats = [IsReachable currentReachabilityStatus];
    
    if (internetStats == NotReachable)
    {
        return 0;
    }
    else
    {
        return 1;
    }
}
+(NSDictionary *)Parse_Adondata
{
    NSString *json = [AppMethod getStringDefault:@"default_adon"];
//    NSError *error;
    NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableDictionary *adondata = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    //NSDictionary *adondata = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    return adondata;
}

+(void)UnderLineStyleTextField:(UITextField *)textField
{
    CALayer *textFieldbottomBorder = [CALayer layer];
    textFieldbottomBorder.frame = CGRectMake(0.0f, textField.frame.size.height - 2, textField.frame.size.width, 5.0f);
    textFieldbottomBorder.backgroundColor = [UIColor blackColor].CGColor;
    [textField.layer addSublayer:textFieldbottomBorder];
}



//underline lable:


//NSDictionary *underlineAttribute = @{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)};
//myLabel.attributedText = [[NSAttributedString alloc] initWithString:@"Test string"
 //                                                        attributes:underlineAttribute];

+(NSDictionary*)dictionaryWithContentsOfJSONString:(NSString*)fileLocation{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileLocation stringByDeletingPathExtension] ofType:[fileLocation pathExtension]];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data
                                                options:kNilOptions error:&error];
    // Be careful here. You add this as a category to NSDictionary
    // but you get an id back, which means that result
    // might be an NSArray as well!
    if (error != nil) return nil;
    return result;
}

//create folder in document
+(NSString*)createDirForImage :(NSString *)dirName
{
    NSString *path;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    path = [[paths objectAtIndex:0] stringByAppendingPathComponent:dirName];
    NSError *error;
    if (![[NSFileManager defaultManager] fileExistsAtPath:path])    //Does directory already exist?
    {
        if (![[NSFileManager defaultManager] createDirectoryAtPath:path
                                       withIntermediateDirectories:NO
                                                        attributes:nil
                                                             error:&error])
        {
            NSLog(@"Create directory error: %@", error);
        }
        
        NSLog(@"path: %@",path);
        
    }
    else
    {
        NSLog(@"Directory already exist");
    }
    //use:[AppMethod createDirForImage:@"Clarify"];
    return path;
}

//corner radious all

+(UIView *)roundCornersOnView:(UIView *)view onTopLeft:(BOOL)tl topRight:(BOOL)tr bottomLeft:(BOOL)bl bottomRight:(BOOL)br radius:(float)radius
{
    if (tl || tr || bl || br) {
        UIRectCorner corner = 0;
        if (tl) corner = corner | UIRectCornerTopLeft;
        if (tr) corner = corner | UIRectCornerTopRight;
        if (bl) corner = corner | UIRectCornerBottomLeft;
        if (br) corner = corner | UIRectCornerBottomRight;
        
        UIView *roundedView = view;
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:roundedView.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = roundedView.bounds;
        maskLayer.path = maskPath.CGPath;
        roundedView.layer.mask = maskLayer;
        return roundedView;
    }
    return view;
}

//create folder in library photos with album

+(void)savePhotoToAlbum:(UIImage*)imageToSave
{
    
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [library addAssetsGroupAlbumWithName:@"GetUMoney" resultBlock:^(ALAssetsGroup *group)
     {
        ///checks if group previously created
        if(group == nil)
        {
            
        //enumerate albums
        [library enumerateGroupsWithTypes:ALAssetsGroupAlbum usingBlock:^(ALAssetsGroup *g, BOOL *stop)
             {
                //if the album is equal to our album
                if ([[g valueForProperty:ALAssetsGroupPropertyName] isEqualToString:@"GetUMoney"]) {
                //save image
                [library writeImageDataToSavedPhotosAlbum:UIImagePNGRepresentation(imageToSave) metadata:nil
                                               completionBlock:^(NSURL *assetURL, NSError *error)
                    {
                  //then get the image asseturl
                    [library assetForURL:assetURL resultBlock:^(ALAsset *asset)
                        {
                        //put it into our album
                            NSLog(@"url %@", assetURL);   
                         [g addAsset:asset];
                         } failureBlock:^(NSError *error)
                        {
                        }];
                    }];
                     
                 }
             }failureBlock:^(NSError *error)
             {
                 
             }];
            
        }else{
            // save image directly to library
            [library writeImageDataToSavedPhotosAlbum:UIImagePNGRepresentation(imageToSave) metadata:nil
                                      completionBlock:^(NSURL *assetURL, NSError *error) {
                                          
                [library assetForURL:assetURL resultBlock:^(ALAsset *asset) {
                    [group addAsset:asset];
                    } failureBlock:^(NSError *error)
                        {
                        }];
                    }];
        }
        
    } failureBlock:^(NSError *error) {
        
    }];
}

+(BOOL)stringMatchedREGEX:(NSString*)input:(NSString*)RegexStr
{
    NSPredicate *myTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", RegexStr];
    if ([myTest evaluateWithObject: input]){
        return true;
    }
    else
    {
        return false;
    }
}
//image capture

//- (UIImage *)captureView {
//    
//    //hide controls if needed
//    CGRect rect = [_mainView bounds];
//    UIGraphicsBeginImageContext(rect.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    [_mainView.layer renderInContext:context];
//    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return img;
//    
//}
//
//use: _img.image = [self captureView];


//Difference Between Two Date
+(NSDateComponents*)components:(NSString*)start_date:(NSString*)end_date:(NSString*)formate
{
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:formate];
    NSDate *startDate = [f dateFromString:start_date];
    NSDate *endDate = [f dateFromString:end_date];
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitDay
                                                        fromDate:startDate
                                                          toDate:endDate
                                                         options:0];
    
    NSLog(@" Difference %ld", [components day]);

    return components;
}


+(NSString *)mimeTypeForData:(NSData* )data
{
    uint8_t c;
    [data getBytes:&c length:1];
    
    switch (c) {
        case 0xFF:
            return @"image/jpeg";
            break;
        case 0x89:
            return @"image/png";
            break;
        case 0x47:
            return @"image/gif";
            break;
        case 0x49:
        case 0x4D:
            return @"image/tiff";
            break;
        case 0x25:
            return @"application/pdf";
            break;
        case 0xD0:
            return @"application/vnd";
            break;
        case 0x46:
            return @"text/plain";
            break;
        default:
            return @"application/octet-stream";
    }
    return nil;
}


//Get MimeType from Path

+(NSString *)mimeTypeFromPath:(NSString* )path
{
CFStringRef pathExtension = (__bridge_retained CFStringRef)[path pathExtension];
CFStringRef type = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, pathExtension, NULL);
CFRelease(pathExtension);

// The UTI can be converted to a mime type:

NSString *mimeType = (__bridge_transfer NSString *)UTTypeCopyPreferredTagWithClass(type, kUTTagClassMIMEType);
if (type != NULL)
CFRelease(type);
    
    return mimeType;
}

+ (NSString *)contentTypeForImageData:(NSData *)data {
    uint8_t c;
    [data getBytes:&c length:1];
    
    switch (c) {
        case 0xFF:
            return @"image/jpeg";
        case 0x89:
            return @"image/png";
        case 0x47:
            return @"image/gif";
        case 0x49:
        case 0x4D:
            return @"image/tiff";
    }
    return nil;
}

//Add days to date

+ (NSString *)addDaysToDate:(NSString *)dateStr:(NSString *)dateFormat:(NSInteger)days {
    NSDateFormatter *dtFormat = [[NSDateFormatter alloc] init];
    [dtFormat setDateFormat:dateFormat];
    NSDate *dt = [dtFormat dateFromString:dateStr];
    
    NSDateComponents *components= [[NSDateComponents alloc] init];
    [components setDay:days];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *newDate = [calendar dateByAddingComponents:components toDate:dt options:0];
    
    return [dtFormat stringFromDate:newDate];
}

//date

//+ (NSString *)removeTimeToDate:(NSString *)dateStr:(NSString *)dateFormat
//{
//    NSDateFormatter *dtFormat = [[NSDateFormatter alloc] init];
//    [dtFormat setDateFormat:dateFormat];
//    NSDate *dt = [dtFormat dateFromString:dateStr];
//    
//    return [dtFormat stringFromDate:newDate];
//}

//get version
//NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
//NSString *appVersion = [infoDict objectForKey:@"CFBundleShortVersionString"]; // example: 1.0.0
//NSString *buildNumber = [infoDict objectForKey:@"CFBundleVersion"];

//get absolute value

+(NSNumber *)absoluteValue:(NSNumber *)input
{
   return [NSNumber numberWithDouble:fabs([input doubleValue])];
   
}

+(BOOL)isEmpty:(NSString *)str{
    if (str == nil || str == (id)[NSNull null] || [[NSString stringWithFormat:@"%@",str] length] == 0 || [[[NSString stringWithFormat:@"%@",str] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0)
    {
        return YES;
    }
    return NO;
}


+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

//image to base 64
//use:    [setdic setObject:[self imageToNSString:_imageuplod.image] forKey:@"profilePic"];

+ (NSString *)imageToNSString:(UIImage *)image
{
    NSData *data = UIImagePNGRepresentation(image);
    
    return [data base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
}


//Get current Date

//NSDate *todayDate = [NSDate date]; //Get todays date
//NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; // here we create NSDateFormatter object for change the Format of date.
//[dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm:ss"]; //Here we can set the format which we need
//NSString *convertedDateString = [dateFormatter stringFromDate:todayDate];// Here convert date in NSString
//NSLog(@"Today formatted date is %@",convertedDateString);


//CGFloat scrollViewHeight = 0.0f;
//for (UIView* view in _AllScrlview.subviews)
//{
//    scrollViewHeight += view.frame.size.height;
//}
//
//[_AllScrlview setContentSize:(CGSizeMake(320, scrollViewHeight))];

+(NSString *)getCurrentDate{
    
    NSDateFormatter *dateTimeFormat = [[NSDateFormatter alloc] init];
    [dateTimeFormat setDateFormat:@"dd-MM-yyyy"];
    
    NSDate *now = [[NSDate alloc] init];
    
    NSString *theDateTime = [dateTimeFormat stringFromDate:now];
    
    dateTimeFormat = nil;
    now = nil;
    
    return theDateTime;
}
+ (NSString *)parseDateFormate:(NSString *)dateString:(NSString *)inputFormat:(NSString *)outputFormat
{
    NSDateFormatter *inputDateFormate = [[NSDateFormatter alloc] init];
    [inputDateFormate setDateFormat:inputFormat];
    NSDate *inputDate = [inputDateFormate dateFromString:dateString];
    
    [inputDateFormate setDateFormat:outputFormat];
    NSString *outputdate = [inputDateFormate stringFromDate:inputDate];
    return outputdate;
}

+(double)getDistanceBWTwoLatLng:(CLLocation*)locationA:(CLLocation*)locationB
{
    CLLocationDistance distance = [locationA distanceFromLocation:locationB];
    double distanceInKm = distance/1000;
    return distanceInKm;
}



//tableview height dynamic


//CGRect frame = _storeTbl.frame;
//frame.size = _storeTbl.contentSize;
//frame.size.height = _storeTbl.contentSize.height;
//_storeTbl.frame = frame;
//
//CGRect contentRect = CGRectZero;
//for (UIView *view in self.AllScrlview.subviews)
//{
//    contentRect = CGRectUnion(contentRect, view.frame);
//}
//self.AllScrlview.contentSize = contentRect.size;

+ (void)setBackgroundGradient:(UIView *)mainView color1Red:(float)colorR1 color1Green:(float)colorG1 color1Blue:(float)colorB1 color2Red:(float)colorR2 color2Green:(float)colorG2 color2Blue:(float)colorB2 alpha:(float)alpha
{
    
    [mainView setBackgroundColor:[UIColor clearColor]];
    CAGradientLayer *grad = [CAGradientLayer layer];
    grad.frame = mainView.bounds;
    
    grad.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:colorR1/255.0 green:colorG1/255.0 blue:colorB1/255.0 alpha:alpha] CGColor], (id)[[UIColor colorWithRed:colorR2/255.0 green:colorG2/255.0 blue:colorB2/255.0 alpha:alpha] CGColor], nil];
    
    [mainView.layer insertSublayer:grad atIndex:0];
}

+(BOOL)chkLogin
{
    return [AppMethod getBoolDefault:DEF_IS_LOGIN];
}


+ (void) styleButton:(UIButton*)button
{
    CALayer *shadowLayer = [CALayer new];
    shadowLayer.frame = button.frame;
    
    shadowLayer.cornerRadius = button.frame.size.height/2;;
    
    shadowLayer.backgroundColor = [UIColor whiteColor].CGColor;
    shadowLayer.opacity = 3.5;
    shadowLayer.shadowColor = [UIColor grayColor].CGColor;
    shadowLayer.shadowOpacity = 5.6;
    shadowLayer.shadowOffset = CGSizeMake(2,2);
    shadowLayer.shadowRadius = 3;
    
    button.layer.cornerRadius = button.frame.size.height/2;;
    button.layer.masksToBounds = YES;
    
    UIView* parent = button.superview;
    [parent.layer insertSublayer:shadowLayer below:button.layer];
}

@end


