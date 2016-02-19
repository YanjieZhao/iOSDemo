//
//  AnnotatedPhotoCell.h
//  iOSDemo
//
//  Created by Netease on 16/1/29.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"

@interface AnnotatedPhotoCell : UICollectionViewCell
@property (nonatomic, strong) Photo *photo;
- (void)setsPhoto:(Photo *)photo;
@end
