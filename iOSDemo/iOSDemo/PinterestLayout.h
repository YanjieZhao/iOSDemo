//
//  PinterestLayout.h
//  iOSDemo
//
//  Created by Netease on 16/1/29.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PinterestLayoutDelegate

- (CGFloat)collectionView:(UICollectionView *)collectionView heightForPhotoAtIndexPath:(NSIndexPath *)indexPath with:(CGFloat)width;
- (CGFloat)collectionView:(UICollectionView *)collectionView heightForAnnotationAtIndexPath:(NSIndexPath *)indexPath withWidth:(CGFloat)width;
@end

@interface PinterestLayout : UICollectionViewLayout
@property (nonatomic, strong) id<PinterestLayoutDelegate> delegate;

@property (nonatomic, assign) int numberOfColumns;
@property (nonatomic, assign) CGFloat cellPadding;

@property (nonatomic, retain) NSMutableArray *cache;
@property (nonatomic, assign) CGFloat contentHeight;
@property (assign, nonatomic) CGFloat contentWidth;

- (CGFloat)getContentWidth;
@end
