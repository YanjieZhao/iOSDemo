//
//  SwipeInteractionController.h
//  UIViewControllerTransition
//
//  Created by Netease on 16/1/14.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeInteractionController : UIPercentDrivenInteractiveTransition
@property (nonatomic, assign) BOOL interactionInProgress;
@property (nonatomic, assign) BOOL shouldCompleteTransition;
@property (nonatomic, weak) UIViewController *viewController;
/**
 *  <#Description#>
 *
 *  @param viewController <#viewController description#>
 */
- (void)wireToViewController:(UIViewController *)viewController;
@end
