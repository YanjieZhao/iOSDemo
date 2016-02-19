//
//  NTFirstViewController.m
//  iOSDemo
//
//  Created by Netease on 16/1/20.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "NTFirstViewController.h"
#import "FlipDismissAnimationController.h"
#import "FlipPresentAnimationController.h"
@interface NTFirstViewController ()
@property (nonatomic, strong) FlipDismissAnimationController *flipDismissAnimationController;
@end

@implementation NTFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.flipDismissAnimationController = [[FlipDismissAnimationController alloc] init];
    
    self.swipeInteractionController = [[SwipeInteractionController alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return nil;
}
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return self.flipDismissAnimationController;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator{
    return self.swipeInteractionController.interactionInProgress ? self.swipeInteractionController : nil;
}
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {
    FlipPresentAnimationController *animator = [FlipPresentAnimationController new];
    //animator.presenting = (operation == UINavigationControllerOperationPush);
    return animator;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"revealSegue"]) {
        segue.sourceViewController.navigationController.delegate = self;
        //(segue.destinationViewController).transitioningDelegate = self;
        [self.swipeInteractionController wireToViewController:segue.destinationViewController];
    }
}

@end
