//
//  UIImage+Decompression.m
//  iOSDemo
//
//  Created by Netease on 16/1/29.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "UIImage+Decompression.h"

@implementation UIImage (Decompression)
- (UIImage *)decompressedImage{
    UIGraphicsBeginImageContextWithOptions(self.size, YES, 0);
    [self drawAtPoint:CGPointZero];
    id decompressedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return decompressedImage;
}
@end
