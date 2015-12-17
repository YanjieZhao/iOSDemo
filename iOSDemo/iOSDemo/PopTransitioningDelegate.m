//
//  PopTransitioningDelegate.m
//  iOSDemo
//
//  Created by Netease on 15/12/17.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import "PopTransitioningDelegate.h"

@implementation PopTransitioningDelegate
-(instancetype)init{
    self = [super init];
    if (self != nil) {
        self.transition = [[PopAnimater alloc] init];
    }
    return self;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self.transition;
}
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return nil;
}
@end
