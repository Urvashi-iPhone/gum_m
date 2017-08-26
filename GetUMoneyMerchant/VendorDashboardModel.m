//
//  VendorDashboard.m
//  GetUMoneyMerchant
//
//  Created by Tecksky Techonologies on 7/19/17.
//  Copyright © 2017 Tecksky Technologies. All rights reserved.
//

#import "VendorDashboard.h"


@implementation VendorDataDashboard

-(id)initWithValue:(NSDictionary*)data
{
    VendorDataDashboard *model =[[VendorDataDashboard alloc]init];
    model.total_approved_bill = [[data valueForKey:@"total_approved_bill"] integerValue];
    model.total_bill_upload = [[data valueForKey:@"total_bill_upload"] integerValue];
    model.total_pending_bill = [[data valueForKey:@"total_pending_bill"] integerValue];
    model.total_rejected_bill = [[data valueForKey:@"total_rejected_bill"] integerValue];
    return model;
}

@end
@implementation VendorDashboard

-(id)initWithValue:(NSDictionary*)data
{
    VendorDashboard *model =[[VendorDashboard alloc]init];
    model.flag = [[data valueForKey:@"flag"] boolValue];
    model.result = [data valueForKey:@"result"];
    
    VendorDataDashboard *dataModel =[[VendorDataDashboard alloc]initwithValue:[data valueForKey:@"data"]];
    model.data = dataModel;
    return model;
}

@end
