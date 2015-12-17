//
//  NavigationControllerDelegate.m
//  iOSDemo
//
//  Created by Netease on 15/12/17.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import "NavigationControllerDelegate.h"
#import "PopAnimater.h"
#import "CircleTransitionAnimator.h"
#import <UIKit/UIKit.h>

@implementation NavigationControllerDelegate
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    return [[CircleTransitionAnimator alloc] init];
}
-(id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    return self.interactionController;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panned:)];
    [self.navigationController.view addGestureRecognizer:panGesture];
}
-(IBAction)panned:(UIPanGestureRecognizer *) gestureRecognizer{
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
        {
            float completionProgress = [gestureRecognizer translationInView:self.navigationController.view].x / CGRectGetWidth(self.navigationController.view.bounds);
            if (completionProgress < 0) {
                return;
            }
            self.interactionController = [[UIPercentDrivenInteractiveTransition alloc] init];
            if (self.navigationController.viewControllers.count > 1) {
                [self.navigationController popViewControllerAnimated:YES];
            }else{
                [self.navigationController.topViewController performSegueWithIdentifier:@"PushSegue" sender:nil];
            }
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            float completionProgress = [gestureRecognizer translationInView:self.navigationController.view].x / CGRectGetWidth(self.navigationController.view.bounds);
            [self.interactionController updateInteractiveTransition:completionProgress];
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            float completionProgress = [gestureRecognizer translationInView:self.navigationController.view].x / CGRectGetWidth(self.navigationController.view.bounds);
            if ([gestureRecognizer velocityInView:self.navigationController.view].x > 0 && completionProgress > 0.5) {
                [self.interactionController finishInteractiveTransition];
            }else{
                
                if (self.navigationController.viewControllers.count > 1) {
                    [[self.navigationController.viewControllers objectAtIndex:1].view removeFromSuperview];
                }
                [self.interactionController cancelInteractiveTransition];
            }
            self.interactionController = nil;
        }
        default:
        {
            [self.interactionController cancelInteractiveTransition];
            self.interactionController = nil;
            break;
        }
    }
}
@end
