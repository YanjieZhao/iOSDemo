//
//  ConstraintsDemoView.m
//  iOSDemo
//
//  Created by Yanjie on 16/4/18.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "ConstraintsDemoView.h"

@implementation ConstraintsDemoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)layoutSubviews
{
    for (UIView *view in self.subviews) {
        NSLog(@"%f, %f, %f, %f", view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
    }
    
    [super layoutSubviews];
}

- (void)updateConstraints
{
    for (UIView *view in self.subviews) {
        NSLog(@"%f, %f, %f, %f", view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
    }
    [super updateConstraints];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
}
@end
