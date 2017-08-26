//
//  AddRatingPathlabModel.m
//  getUMoney
//
//  Created by Tecksky Techonologies on 6/2/17.
//  Copyright © 2017 Tecksky Technologies. All rights reserved.
//

#import "CommonModel.h"

@implementation CommonModel

-(id)initWithValue:(NSDictionary*)data
{
    CommonModel *model =[[CommonModel alloc]init];
    model.flag = [[data valueForKey:@"flag"] boolValue];
    model.result = [data valueForKey:@"result"];
    model.data = [data valueForKey:@"data"];
    return model;
}


@end
