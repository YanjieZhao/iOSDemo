//
//  CircleTransitionAnimator.m
//  iOSDemo
//
//  Created by Netease on 15/12/17.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import "CircleTransitionAnimator.h"
#import "InteractiveTransitionViewController.h"

@implementation CircleTransitionAnimator
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return .5f;
}
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    self.transitionContext = transitionContext;
    
    UIView *containerView = [transitionContext containerView];
    InteractiveTransitionViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    InteractiveTransitionViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIButton *button = fromViewController.button;
    
    [containerView addSubview:toViewController.view];
    CGRect rect = button.frame;
    UIBezierPath *circleMaskPathInitial = [UIBezierPath bezierPathWithOvalInRect:button.frame];
    CGPoint extremePoint = CGPointMake(button.center.x - 0, button.center.y - CGRectGetHeight(toViewController.view.bounds));
    float radius = sqrt((extremePoint.x*extremePoint.x) + (extremePoint.y * extremePoint.y));
    UIBezierPath *circleMaskPathFinal = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(button.frame, -radius, -radius)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.path = circleMaskPathFinal.CGPath;
    toViewController.view.layer.mask = maskLayer;
    
    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    ;
    maskLayerAnimation.duration = 0.5f;
    [maskLayerAnimation setFromValue:(id)circleMaskPathInitial.CGPath];
    [maskLayerAnimation setToValue:(id)circleMaskPathFinal.CGPath];
    maskLayerAnimation.delegate = self;
    [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self.transitionContext completeTransition:!self.transitionContext.transitionWasCancelled];
    [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
}
@end
