//
//  PinterestLayout.m
//  iOSDemo
//
//  Created by Netease on 16/1/29.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "PinterestLayout.h"

@implementation PinterestLayout

-(instancetype)init{
    self = [super init];
    if (self == nil) {
        return self;
    }
    
    self.numberOfColumns = 2;
    self.cellPadding = 6.0;
    self.cache = [NSMutableArray arrayWithCapacity:10];
    self.contentHeight = 0.0;
    UIEdgeInsets insets = self.collectionView.contentInset;
    self.contentWidth = CGRectGetWidth(self.collectionView.bounds) - (insets.left + insets.right);
    return self;
}
- (CGFloat)getContentWidth{
    UIEdgeInsets insets = self.collectionView.contentInset;
    self.contentWidth = CGRectGetWidth(self.collectionView.bounds) - (insets.left + insets.right);
    return self.contentWidth;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *layoutAttributes = [[NSMutableArray alloc] init];
    for (id attributes in self.cache) {
        if (CGRectIntersectsRect([attributes frame], rect)) {
            [layoutAttributes addObject:attributes];
        }
    }
    return layoutAttributes;
}

- (CGSize)collectionViewContentSize{
    return CGSizeMake(self.contentWidth, self.contentHeight);
}

- (void)prepareLayout{
    if (self.cache != nil && self.cache.count > 0) {
        return;
    }
    self.numberOfColumns = 2;
    self.cellPadding = 6.0;
    self.cache = [NSMutableArray arrayWithCapacity:10];
    self.contentHeight = 0.0;
    UIEdgeInsets insets = self.collectionView.contentInset;
    self.contentWidth = CGRectGetWidth(self.collectionView.bounds) - (insets.left + insets.right);
    
    
    CGFloat columnWidth = self.contentWidth / (CGFloat)self.numberOfColumns;
    
    NSMutableArray *xOffset = [[NSMutableArray alloc] init];
    for (int column = 0; column < self.numberOfColumns; ++column) {
        [xOffset addObject:[NSNumber numberWithDouble:((CGFloat)column * columnWidth)]];
    }
    
    int column = 0;
    NSMutableArray *yOffset = [NSMutableArray arrayWithCapacity:self.numberOfColumns];
    for (int i = 0; i < self.numberOfColumns; ++i) {
        [yOffset addObject:[NSNumber numberWithInt:0]];
    }
    
    for (int i = 0; i < [self.collectionView numberOfItemsInSection:0]; ++i) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        CGFloat width = columnWidth - self.cellPadding * 2;
        CGFloat photoHeight = [self.delegate collectionView:self.collectionView heightForPhotoAtIndexPath:indexPath with:width];
        CGFloat annotationHeight = [self.delegate collectionView:self.collectionView heightForAnnotationAtIndexPath:indexPath withWidth:width];
        
        CGFloat height = self.cellPadding + photoHeight + annotationHeight + self.cellPadding;
        CGRect frame = CGRectMake([(NSNumber *)xOffset[column] doubleValue], [(NSNumber *)yOffset[column] doubleValue], columnWidth, height);
        CGRect insetFrame = CGRectInset(frame, self.cellPadding, self.cellPadding);
        
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.frame = insetFrame;
        [self.cache addObject:attributes];
        
        self.contentHeight = MAX(self.contentHeight, CGRectGetMaxY(frame));
        CGFloat offset = [yOffset[column] doubleValue] + height;
        yOffset[column] = [NSNumber numberWithDouble:offset];
        
        column = column >= (self.numberOfColumns - 1) ? 0 : ++column;
    }
}
@end
