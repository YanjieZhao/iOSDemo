//
//  Response.h
//  iOSDemo
//
//  Created by Netease on 16/1/4.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"
#import "Categray.h"

@interface Response : MTLModel<MTLJSONSerializing>
@property (nonatomic, strong) NSArray *bookList;
@property (nonatomic) BOOL isSuccess;
@end
