//
//  Categray.h
//  iOSDemo
//
//  Created by Netease on 16/1/4.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

@interface Categray : MTLModel<MTLJSONSerializing>
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *iconUrl;
@property (nonatomic, strong) NSString *url;
@end
