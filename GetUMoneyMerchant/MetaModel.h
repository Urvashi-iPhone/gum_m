//
//  MetaModel.h
//  getUMoney
//
//  Created by Tecksky Techonologies on 5/17/17.
//  Copyright © 2017 Tecksky Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MetaModel : NSObject

@property(nonatomic)int currentPage;
@property(nonatomic)int perPage;
@property(nonatomic)int totalPages;
@property(nonatomic)int totalProducts;

-(id)initWithValue:(NSDictionary*)data;

@end
