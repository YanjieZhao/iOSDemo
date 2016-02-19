//
//  Photo.h
//  iOSDemo
//
//  Created by Netease on 16/1/29.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Photo : NSObject
+ (NSArray *)allPhotos;
- (instancetype)initWithCaption:(NSString *)caption comment:(NSString *)comment image:(UIImage *)image;
- (instancetype)initWithDict:(NSDictionary *)dictionary;
- (CGFloat)heightForComment:(UIFont *)fount width:(CGFloat)width;

@property (copy, nonatomic) NSString *caption;
@property (copy, nonatomic) NSString *comment;
@property (strong, nonatomic) UIImage *image;
@end
