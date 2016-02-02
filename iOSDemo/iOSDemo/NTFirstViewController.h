//
//  NTFirstViewController.h
//  iOSDemo
//
//  Created by Netease on 16/1/20.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SwipeInteractionController.h"
@interface NTFirstViewController : UIViewController<UINavigationControllerDelegate>
@property (nonatomic, strong) SwipeInteractionController* swipeInteractionController;

@end
