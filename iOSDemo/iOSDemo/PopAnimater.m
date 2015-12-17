//
//  PopAnimater.m
//  iOSDemo
//
//  Created by Netease on 15/12/17.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import "PopAnimater.h"

@implementation PopAnimater
-(instancetype)init{
    self = [super init];
    if (self != nil) {
        self.duration = 1.f;
        self.presenting = YES;
        self.originFrame = CGRectMake(120, 400, 150, 200);
    }
    return self;
}
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return self.duration;
}
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIView *containerView = [transitionContext containerView];
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    UIView *herbView = self.presenting ? toView : [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    //herbView.frame = [transitionContext viewForKey:UITransitionContextFromViewKey].frame;
    
    CGRect initialFrame = self.presenting ? self.originFrame : herbView.frame;
    CGRect finalFrame = self.presenting ? herbView.frame : self.originFrame;
    
    float xScaleFactor = self.presenting ? initialFrame.size.width / finalFrame.size.width : finalFrame.size.width / initialFrame.size.width;
    float yScaleFactor = self.presenting ? initialFrame.size.height / finalFrame.size.height : finalFrame.size.height / initialFrame.size.height;
    
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(xScaleFactor, yScaleFactor);
    if (self.presenting) {
        herbView.transform = scaleTransform;
        herbView.center = CGPointMake(CGRectGetMidX(initialFrame), CGRectGetMidY(initialFrame));
    }
    
    CABasicAnimation *round = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    float from = self.presenting ? 20.0f / xScaleFactor : 0.0f;
    round.fromValue = [NSNumber numberWithFloat:from];
    round.toValue = [NSNumber numberWithFloat:self.presenting ? 0.0f : 20.0 / xScaleFactor];
    [herbView.layer addAnimation:round forKey:nil];
    herbView.layer.cornerRadius = self.presenting ? 0.0 : 20.0/xScaleFactor;
    
    [containerView addSubview:toView];
    [containerView bringSubviewToFront:herbView];
    
    [UIView animateWithDuration:self.duration delay:0.0 usingSpringWithDamping:0.4 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveLinear animations:^{ herbView.transform = self.presenting ? CGAffineTransformIdentity : scaleTransform;
        herbView.center = CGPointMake(CGRectGetMidX(finalFrame), CGRectGetMidY(finalFrame));
    } completion:^(BOOL finished){
        [transitionContext completeTransition:YES];
    }];
}
@end

