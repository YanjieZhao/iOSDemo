//
//  WXResult.m
//  iOSDemo
//
//  Created by Netease on 16/2/3.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "WXResult.h"

@implementation WXResult
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return
  @{
    @"refresh_token":@"refresh_token",
    @"scope":@"scope",
    @"unionid":@"unionid",
    @"expires_in":@"expires_in",
    @"access_token":@"access_token",
    @"openid":@"openid"
    };
}
@end
