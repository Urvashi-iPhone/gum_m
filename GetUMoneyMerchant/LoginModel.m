//
//  LoginModel.m
//  getUMoney
//
//  Created by Tecksky Techonologies on 5/16/17.
//  Copyright © 2017 Tecksky Technologies. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginDataModel

-(id)initwithValue:(NSDictionary*)data
{
    LoginDataModel *model =[[LoginDataModel alloc]init];
    model.email = [data valueForKey:@"email"];
    model.ext = [data valueForKey:@"ext"];
    model.is_new = [[data valueForKey:@"is_new"] integerValue];
    model.mem_name = [data valueForKey:@"mem_name"];
    model.member_id = [data valueForKey:@"member_id"];
    model.mobile = [data valueForKey:@"mobile"];
    model.password = [data valueForKey:@"password"];
    model.posted = [data valueForKey:@"posted"];
    model.profile_pic = [data valueForKey:@"profile_pic"];
    model.ref_code = [data valueForKey:@"ref_code"];
    model.ref_id = [data valueForKey:@"ref_id"];
    model.ref_paid = [data valueForKey:@"ref_paid"];
    model.status = [data valueForKey:@"status"];
    return model;
}
@end

@implementation LoginModel

-(id)initWithValue:(NSDictionary*)data
{
    LoginModel *model =[[LoginModel alloc]init];
    model.flag = [[data valueForKey:@"flag"] boolValue];
    model.result = [data valueForKey:@"result"];
    
    LoginDataModel *dataModel =[[LoginDataModel alloc]initwithValue:[data valueForKey:@"data"]];
    model.data = dataModel;
    return model;
}
@end
