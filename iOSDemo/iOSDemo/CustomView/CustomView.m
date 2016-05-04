//
//  CustomView.m
//  iOSDemo
//
//  Created by Yanjie on 16/4/19.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        UIView *containerView = [[[UINib nibWithNibName:@"CustomView" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        CGRect newFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        containerView.frame = newFrame;
        [self addSubview:containerView];
        
    }
    return self;
}
- (void)awakeFromNib
{
    [super awakeFromNib];
}
//- (id) awakeAfterUsingCoder:(NSCoder*)aDecoder {
//    BOOL isJustAPlaceholder = ([[self subviews] count] == 0);
//    if (isJustAPlaceholder) {
//        CustomView* theRealThing = [self getClassObjectFromNib:[CustomView class]];
//        
//        theRealThing.frame = self.frame;
//        
//        // make compatible with Auto Layout
//        self.translatesAutoresizingMaskIntoConstraints = NO;
//        theRealThing.translatesAutoresizingMaskIntoConstraints = NO;
//        
//        // convince ARC that we're legit, unnecessary since at least Xcode 4.5
//        CFRelease((__bridge const void*)self);
//        CFRetain((__bridge const void*)theRealThing);
//        
//        return theRealThing;
//    }
//    return self;
//}
//- (id)getClassObjectFromNib:(Class)class
//{
//    NSString *nibName = NSStringFromClass(class);
//    return [[[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil] firstObject];
//}
@end
