//
//  SetGetDemo.h
//  iOSDemo
//
//  Created by 赵艳杰 on 16/3/22.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SetGetDemo : NSObject
{
    int x;
}
@property (getter=getGender, nonatomic, assign) int x;
@end
