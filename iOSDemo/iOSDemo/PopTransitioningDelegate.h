//
//  PopTransitioningDelegate.h
//  iOSDemo
//
//  Created by Netease on 15/12/17.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PopAnimater.h"

@interface PopTransitioningDelegate : NSObject<UIViewControllerTransitioningDelegate>
@property PopAnimater* transition;
@end
