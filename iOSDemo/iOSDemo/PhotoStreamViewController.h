//
//  PhotoStreamViewController.h
//  iOSDemo
//
//  Created by Netease on 16/1/29.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PinterestLayout.h"
@interface PhotoStreamViewController : UICollectionViewController<PinterestLayoutDelegate>
@property (nonatomic, retain) NSArray *photos;
@end
