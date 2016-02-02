//
//  FlipDismissAnimationController.m
//  UIViewControllerTransition
//
//  Created by Netease on 16/1/14.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "FlipDismissAnimationController.h"
#import "AnimationHelper.h"
@implementation FlipDismissAnimationController 
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 3.0;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    if (fromVC == nil || toVC == nil || containerView == nil) {
        return;
    }
    
    CGRect finalFrame = self.destinationFram;
    
    UIView *snapshot = [fromVC.view snapshotViewAfterScreenUpdates:NO];
    snapshot.layer.cornerRadius = 25;
    snapshot.layer.masksToBounds = YES;
    
    [containerView addSubview:toVC.view];
    [containerView addSubview:snapshot];
    fromVC.view.hidden = true;
    
    [AnimationHelper perspectiveTransformForContainerView:containerView];
    toVC.view.layer.transform = [AnimationHelper yRotation:-M_PI_2];
    
    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                   delay:0
                                 options:UIViewKeyframeAnimationOptionCalculationModeCubic
                              animations:^{
                                  [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.33 animations:^{
                                      snapshot.frame = finalFrame;
                                  }];
                                  [UIView addKeyframeWithRelativeStartTime:0.33 relativeDuration:0.33 animations:^{
                                      snapshot.layer.transform = [AnimationHelper yRotation:M_PI_2];
                                  }];
                                  [UIView addKeyframeWithRelativeStartTime:0.64 relativeDuration:0.33 animations:^{
                                      toVC.view.layer.transform = [AnimationHelper yRotation:0.0];
                                  }];
                              } completion:^(BOOL finished) {
                                  fromVC.view.hidden = NO;
                                  [snapshot removeFromSuperview];
                                  [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                              }];
}
@end
