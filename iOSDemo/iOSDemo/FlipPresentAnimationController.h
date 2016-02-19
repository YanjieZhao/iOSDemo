//
//  FlipPresentAnimationController.h
//  UIViewControllerTransition
//
//  Created by Netease on 16/1/14.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FlipPresentAnimationController : NSObject <UIViewControllerAnimatedTransitioning>
@property (nonatomic, assign) CGRect originFrame;
@end
