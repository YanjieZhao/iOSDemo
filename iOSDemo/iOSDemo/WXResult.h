//
//  WXResult.h
//  iOSDemo
//
//  Created by Netease on 16/2/3.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

@interface WXResult : MTLModel<MTLJSONSerializing>
@property (nonatomic, copy) NSString * refresh_token;
@property (nonatomic, copy) NSString * scope;
@property (nonatomic, copy) NSString * unionid;
@property (nonatomic, assign) NSNumber*  expires_in;
@property (nonatomic, copy) NSString * access_token;
@property (nonatomic, copy) NSString * openid;
@end
