//
//  Categray.m
//  iOSDemo
//
//  Created by Netease on 16/1/4.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "Categray.h"

@implementation Categray
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"author": @"author",
             @"title": @"title",
             @"iconUrl": @"iconUrl",
             @"url": @"url"
             };
}
@end
