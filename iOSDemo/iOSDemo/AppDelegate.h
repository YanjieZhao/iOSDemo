//
//  AppDelegate.h
//  iOSDemo
//
//  Created by Netease on 15/12/17.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiXinDelegate.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) WeiXinDelegate *weixinDelegate;

@end

