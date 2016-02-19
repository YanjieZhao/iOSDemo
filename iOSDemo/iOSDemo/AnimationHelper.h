//
//  AnimationHelper.h
//  UIViewControllerTransition
//
//  Created by Netease on 16/1/14.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AnimationHelper : NSObject
+ (CATransform3D)yRotation:(double) angle;
+ (void)perspectiveTransformForContainerView:(UIView *)containerView;
@end
