//
//  AnnotatedPhotoCell.m
//  iOSDemo
//
//  Created by Netease on 16/1/29.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "AnnotatedPhotoCell.h"

@interface AnnotatedPhotoCell ()
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *imageViewHeightLayoutConstraint;
@property (nonatomic, weak) IBOutlet UILabel *captionLabel;
@property (nonatomic, weak) IBOutlet UILabel *commentLabel;

@end

@implementation AnnotatedPhotoCell
- (instancetype)init{
    if (!(self = [super init])) {
        self.photo = [[Photo alloc] init];
    }
    return self;
}
- (void)setsPhoto:(Photo *)photo{
    self.photo = photo;
    self.imageView.image = photo.image;
    self.captionLabel.text = photo.caption;
    self.commentLabel.text = photo.comment;    
}
@end
