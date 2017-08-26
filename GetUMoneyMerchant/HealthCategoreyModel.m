//
//  HealthCategoreyModel.m
//  getUMoney
//
//  Created by Tecksky Techonologies on 5/18/17.
//  Copyright © 2017 Tecksky Technologies. All rights reserved.
//

#import "HealthCategoreyModel.h"

@implementation HealthCategoreyDataModel

-(id)initWithValue:(NSDictionary*)data
{
    HealthCategoreyDataModel *model =[[HealthCategoreyDataModel alloc]init];
    model.created_at = [data valueForKey:@"created_at"];
    model.ext = [data valueForKey:@"ext"];
    model.image_path = [data valueForKey:@"image_path"];
    model.name = [data valueForKey:@"name"];
    model.pathlab_category_id = [data valueForKey:@"pathlab_category_id"];
    model.status = [data valueForKey:@"status"];
    model.updated_at = [data valueForKey:@"updated_at"];
     model.ticket_txt = [data valueForKey:@"ticket_txt"];
    
    return model;
}

@end

@implementation HealthCategoreyModel

-(id)initWithValue:(NSDictionary*)data
{
    HealthCategoreyModel *model =[[HealthCategoreyModel alloc]init];
    model.flag = [[data valueForKey:@"flag"] boolValue];
    model.result = [data valueForKey:@"result"];
    
    NSMutableArray<HealthCategoreyDataModel*>*helth = [[NSMutableArray alloc] init];
    
    NSMutableArray *subMetaArray = [data valueForKey:@"data"];
    
    for (int i = 0; i<subMetaArray.count; i++)
    {
        NSMutableDictionary *dic =[subMetaArray objectAtIndex:i];
        HealthCategoreyDataModel *healthData =[[HealthCategoreyDataModel alloc] initWithValue:dic];
        [helth addObject:healthData];
    }
    model.data =helth;
    
    
    return model;
}

@end



