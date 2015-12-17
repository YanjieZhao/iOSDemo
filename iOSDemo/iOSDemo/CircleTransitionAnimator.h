//
//  CircleTransitionAnimator.h
//  iOSDemo
//
//  Created by Netease on 15/12/17.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CircleTransitionAnimator : NSObject<UIViewControllerAnimatedTransitioning>
@property (weak) id<UIViewControllerContextTransitioning> transitionContext;
@end
