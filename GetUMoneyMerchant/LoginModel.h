//
//  LoginModel.h
//  getUMoney
//
//  Created by Tecksky Techonologies on 5/16/17.
//  Copyright © 2017 Tecksky Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LoginDataModel : NSObject

@property(nonatomic)NSString *email;
@property(nonatomic)NSString *ext;
@property(nonatomic)NSInteger is_new;
@property(nonatomic)NSString *mem_name;
@property(nonatomic)NSString *member_id;
@property(nonatomic)NSString *mobile;
@property(nonatomic)NSString *password;
@property(nonatomic)NSString *posted;
@property(nonatomic)NSString *profile_pic;
@property(nonatomic)NSString *ref_code;
@property(nonatomic)NSString *ref_id;
@property(nonatomic)NSString *ref_paid;
@property(nonatomic)NSString *status;

-(id)initwithValue:(NSDictionary*)data;


@end

@interface LoginModel : NSObject

@property(nonatomic)BOOL flag;
@property(nonatomic)NSString *result;
@property(nonatomic)LoginDataModel *data;

-(id)initWithValue:(NSDictionary*)data;

@end


