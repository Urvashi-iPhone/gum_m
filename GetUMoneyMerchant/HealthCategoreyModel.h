//
//  HealthCategoreyModel.h
//  getUMoney
//
//  Created by Tecksky Techonologies on 5/18/17.
//  Copyright © 2017 Tecksky Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HealthCategoreyDataModel : NSObject

@property(nonatomic)NSString *created_at;
@property(nonatomic)NSString *ext;
@property(nonatomic)NSString *image_path;
@property(nonatomic)NSString *name;
@property(nonatomic)NSString *pathlab_category_id;
@property(nonatomic)NSString *status;
@property(nonatomic)NSString *updated_at;
@property(nonatomic)NSString *ticket_txt;

-(id)initWithValue:(NSDictionary*)data;

@end


@interface HealthCategoreyModel : NSObject

@property(nonatomic)BOOL flag;
@property(nonatomic)NSString *result;
@property(nonatomic)NSMutableArray <HealthCategoreyDataModel*>*data;
-(id)initWithValue:(NSDictionary*)data;

@end


