//
//  VendorDashboard.h
//  GetUMoneyMerchant
//
//  Created by Tecksky Techonologies on 7/19/17.
//  Copyright © 2017 Tecksky Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface VendorDataDashboard : NSObject

@property(nonatomic)NSInteger total_approved_bill;
@property(nonatomic)NSInteger total_bill_upload;
@property(nonatomic)NSInteger total_pending_bill;
@property(nonatomic)NSInteger total_rejected_bill;

-(id)initwithValue:(NSDictionary*)data;

@end

@interface VendorDashboard : NSObject

@property(nonatomic)BOOL flag;
@property(nonatomic)NSString *result;
@property(nonatomic)VendorDataDashboard *data;

-(id)initWithValue:(NSDictionary*)data;

@end
