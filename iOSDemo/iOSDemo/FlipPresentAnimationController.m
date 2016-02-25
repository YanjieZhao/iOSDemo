//
//  FlipPresentAnimationController.m
//  UIViewControllerTransition
//
//  Created by Netease on 16/1/14.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "FlipPresentAnimationController.h"
#import "AnimationHelper.h"
@interface FlipPresentAnimationController ()
@end

/**
 *  add some change
 */
@implementation FlipPresentAnimationController
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 1.5;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    if (fromVC == nil || toVC == nil || containerView == nil) {
        return;
    }
    
    CGRect initialFrame = self.originFrame;
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    
    UIView *snapshot = [toVC.view snapshotViewAfterScreenUpdates:YES];
    snapshot.frame = initialFrame;
    snapshot.layer.cornerRadius = 25;
    snapshot.layer.masksToBounds = YES;
    
    [AnimationHelper perspectiveTransformForContainerView:containerView];
    snapshot.layer.transform = [AnimationHelper yRotation:M_PI_2];
    
    [containerView addSubview:toVC.view];
    [containerView addSubview:snapshot];
    toVC.view.hidden = YES;
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateKeyframesWithDuration:duration
                                   delay:0
                                 options:UIViewKeyframeAnimationOptionCalculationModeCubic
                              animations:^{
                                  [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.33 animations:^{
                                      fromVC.view.layer.transform = [AnimationHelper yRotation:-M_PI_2];
                                  }];
                                  [UIView addKeyframeWithRelativeStartTime:0.33 relativeDuration:0.33 animations:^{
                                      snapshot.layer.transform = [AnimationHelper yRotation:0.0];
                                  }];
                                  [UIView addKeyframeWithRelativeStartTime:0.66 relativeDuration:0.34 animations:^{
                                      snapshot.frame = finalFrame;
                                  }];
                                 } completion:^(BOOL finished) {
                                     toVC.view.hidden = NO;
                                     [snapshot removeFromSuperview];
                                     fromVC.view.layer.transform = [AnimationHelper yRotation:0.0];
                                     [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                                 }];
}
@end
