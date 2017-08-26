
//
//  MetaModel.m
//  getUMoney
//
//  Created by Tecksky Techonologies on 5/17/17.
//  Copyright © 2017 Tecksky Technologies. All rights reserved.
//

#import "MetaModel.h"

@implementation MetaModel

-(id)initWithValue:(NSDictionary*)data
{
    MetaModel *model =[[MetaModel alloc]init];
    model.totalProducts = [[data valueForKey:@"totalProducts"] integerValue];
    model.currentPage = [[data valueForKey:@"currentPage"] integerValue];
    model.perPage = [[data valueForKey:@"perPage"] integerValue];
    model.totalPages = [[data valueForKey:@"totalPages"] integerValue];
    return model;
}

@end
