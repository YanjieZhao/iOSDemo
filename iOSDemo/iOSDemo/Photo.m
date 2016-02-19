//
//  Photo.m
//  iOSDemo
//
//  Created by Netease on 16/1/29.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "Photo.h"
#import "UIImage+Decompression.h"

@implementation Photo
+ (NSArray *)allPhotos{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"Photos" withExtension:@"plist"];
    NSArray *list = [NSArray arrayWithContentsOfURL:URL];
    
    for (NSDictionary *dictionary in list) {
        Photo *photo = [[Photo alloc] initWithDict:dictionary];
        [array addObject:photo];
    }
    
    return array;
}

- (instancetype)initWithCaption:(NSString *)caption comment:(NSString *)comment image:(UIImage *)image{
    self = [super init];
    if (self != nil) {
        self.comment = comment;
        self.caption = caption;
        self.image = image;
    }
    
    return self;
}

- (instancetype)initWithDict:(NSDictionary *)dictionary{
    NSString *caption = dictionary[@"Caption"];
    NSString *comment = dictionary[@"Comment"];
    NSString *photoName = dictionary[@"Photo"];
    UIImage *image = [[UIImage imageNamed:photoName] decompressedImage];
    return [self initWithCaption:caption comment:comment image:image];
}

- (CGFloat)heightForComment:(UIFont *)fount width:(CGFloat)width{
    NSMutableDictionary *att = [NSMutableDictionary dictionary];
    [att setValue:fount forKey:NSFontAttributeName];
    CGSize size = CGSizeMake(width, CGFLOAT_MAX);
    CGRect rect = [self.comment boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:att context:nil];
    return ceil(rect.size.height);
}
@end
