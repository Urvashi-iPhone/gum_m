//
//  AddRatingPathlabModel.h
//  getUMoney
//
//  Created by Tecksky Techonologies on 6/2/17.
//  Copyright © 2017 Tecksky Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonModel : NSObject

@property(nonatomic)BOOL flag;
@property(nonatomic)NSString *result;
@property(nonatomic)NSMutableArray *data;

-(id)initWithValue:(NSDictionary*)data;


@end
