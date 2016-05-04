//
//  SetGetDemo.m
//  iOSDemo
//
//  Created by 赵艳杰 on 16/3/22.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "SetGetDemo.h"

@implementation SetGetDemo
- (void)setSSS
{
    //x = 1;
    //SetGetDemo *demo = [[SetGetDemo alloc] init];
    
    //x = 1;
}
@synthesize x;
- (int)getGender
{
    x += 10;
    return x;
}
- (void)setSex:(int)value
{
    x += value;
}
- (int)x
{
    return x;
}
@end
