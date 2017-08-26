//
//  AppMethod.h
//  Runmileapp
//
//  Created by Tecksky Techonologies on 9/3/16.
//  Copyright © 2016 Tecksky Techonologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AppMethod : NSObject

+(void)setStringDefault:(NSString*)key:(NSString*)value;
+(NSString*)getStringDefault:(NSString*)key;

+(void)setBoolDefault:(NSString*)key:(BOOL)value;
+(BOOL)getBoolDefault:(NSString*)key;

+(void)setIntegerDefault:(NSString *)key :(NSInteger)value;
+(NSInteger)getIntegerDefault:(NSString *)key;

+(void)setDoubleDefault:(NSString *)key :(double)value;
+(double)getDoubleDefault:(NSString *)key;


+(void)setDictionaryDefault:(NSString*)key:(NSDictionary*)value;
+(NSDictionary*)getDictionaryDefault:(NSString*)key;

+(NSString *)convertHTML:(NSString *)html;
+(NSInteger)getIntegerDefault:(NSString *)key;
+(void)setArrayDefault:(NSMutableArray*)key:(NSMutableArray*)value;
+(NSMutableArray*)getArrayDefault:(NSMutableArray*)key;

+(NSInteger)Check_Internet;
+(NSDictionary *)Parse_Adondata;

+(void)UnderLineStyleTextField:(UITextField*)textField;

+(NSDictionary*)dictionaryWithContentsOfJSONString:(NSString*)fileLocation;
+(NSString*)createDirForImage :(NSString *)dirName;

+(UIView *)roundCornersOnView:(UIView *)view onTopLeft:(BOOL)tl topRight:(BOOL)tr bottomLeft:(BOOL)bl bottomRight:(BOOL)br radius:(float)radius;

+(void)savePhotoToAlbum:(UIImage*)imageToSave;
+(BOOL)stringMatchedREGEX:(NSString*)input:(NSString*)RegexStr;

+(NSDateComponents*)components:(NSString*)start_date:(NSString*)end_date:(NSString*)formate;

+ (NSString *)dateStringWithStyle:(NSDateFormatterStyle)style;


+(NSString *)mimeTypeForData:(NSData* )data;

+(NSString *)mimeTypeFromPath:(NSString* )path;

+ (NSString *)addDaysToDate:(NSString *)dateStr:(NSString *)dateFormat:(NSInteger)days;

+(NSNumber *)absoluteValue:(NSNumber *)input;
+(BOOL)isEmpty:(NSString *)str;

+ (UIColor *)colorFromHexString:(NSString *)hexString;

//image base 64
+ (NSString *)imageToNSString:(UIImage *)image;

+ (void)alert: (UIViewController *) view title: (NSString *) title message: (NSString *) message;

+(NSString *)getCurrentDate;
+ (NSString *)contentTypeForImageData:(NSData *)data;
+ (NSString *)parseDateFormate:(NSString *)dateString:(NSString *)inputFormat:(NSString *)outputFormat;

+(double)getDistanceBWTwoLatLng:(CLLocation*)locationA:(CLLocation*)locationB;
+ (void)setBackgroundGradient:(UIView *)mainView color1Red:(float)colorR1 color1Green:(float)colorG1 color1Blue:(float)colorB1 color2Red:(float)colorR2 color2Green:(float)colorG2 color2Blue:(float)colorB2 alpha:(float)alpha;

+(BOOL)chkLogin;

//button shadow
+ (void) styleButton:(UIButton*)button;

@end

