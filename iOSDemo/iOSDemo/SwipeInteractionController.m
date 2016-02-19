//
//  SwipeInteractionController.m
//  UIViewControllerTransition
//
//  Created by Netease on 16/1/14.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "SwipeInteractionController.h"

@implementation SwipeInteractionController
- (void)wireToViewController:(UIViewController *)viewController{
    self.viewController = viewController;
    [self prepareGestureRecognizerInView:viewController.view];
}
- (void)prepareGestureRecognizerInView:(UIView *)view{
    UIScreenEdgePanGestureRecognizer *gesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    gesture.edges = UIRectEdgeLeft;
    [view addGestureRecognizer:gesture];
}

- (void)handleGesture:(UIScreenEdgePanGestureRecognizer *)gestureRecognizer{
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view.superview];
    float progress = (translation.x / 200.0f);
    progress = fminf(fmaxf(progress, 0.0), 1.0);
    
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
            self.interactionInProgress = YES;
            [self.viewController.navigationController popViewControllerAnimated:YES];
            break;
        case UIGestureRecognizerStateChanged:
            self.shouldCompleteTransition = progress > 0.5;
            [self updateInteractiveTransition:progress];
            break;
        case UIGestureRecognizerStateCancelled:
            self.interactionInProgress = NO;
            [self cancelInteractiveTransition];
            break;
        case UIGestureRecognizerStateEnded:
            self.interactionInProgress = NO;
            if (!self.shouldCompleteTransition) {
                [self cancelInteractiveTransition];
            } else {
                [self finishInteractiveTransition];
            }
            break;
        default:
            break;
    }
}
@end
