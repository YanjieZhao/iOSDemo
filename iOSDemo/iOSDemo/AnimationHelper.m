//
//  AnimationHelper.m
//  UIViewControllerTransition
//
//  Created by Netease on 16/1/14.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "AnimationHelper.h"

@implementation AnimationHelper
+ (CATransform3D)yRotation:(double) angle{
    CGFloat top = (CGFloat)angle;
    return CATransform3DMakeRotation(top, 0.0, 1.0, 0.0);
}
+ (void)perspectiveTransformForContainerView:(UIView *)containerView{
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -0.002;
    containerView.layer.sublayerTransform = transform;
}
@end
