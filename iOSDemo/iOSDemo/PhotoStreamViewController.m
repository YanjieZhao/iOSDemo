//
//  PhotoStreamViewController.m
//  iOSDemo
//
//  Created by Netease on 16/1/29.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "PhotoStreamViewController.h"
#import "Photo.h"
#import "AnnotatedPhotoCell.h"
#import <AVFoundation/AVFoundation.h>
@interface PhotoStreamViewController ()

@end

@implementation PhotoStreamViewController

static NSString * const reuseIdentifier = @"AnnotatedPhotoCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    PinterestLayout *layout = ((PinterestLayout *)self.collectionView.collectionViewLayout);
    layout.delegate = self;
    self.photos = [Photo allPhotos];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)collectionView:(UICollectionView *)collectionView heightForPhotoAtIndexPath:(NSIndexPath *)indexPath with:(CGFloat)width{
    Photo *photo = self.photos[indexPath.row];
    CGRect boundingRect = CGRectMake(0, 0, width, CGFLOAT_MAX);
    CGRect rect = AVMakeRectWithAspectRatioInsideRect(photo.image.size, boundingRect);
    CGFloat height = rect.size.height;
    return height;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView heightForAnnotationAtIndexPath:(NSIndexPath *)indexPath withWidth:(CGFloat)width{
    CGFloat annotationPadding = 4.0f;
    CGFloat annotationHeaderHeight = 17.0f;
    Photo *photo = self.photos[indexPath.item];
    UIFont *font = [UIFont fontWithName:@"AvenirNext-Regular" size:10];// UIFont(name: "AvenirNext-Regular", size: 10)!
    CGFloat commentHeight = [photo heightForComment:font width:width];// photo.heightForComment(font, width: width)
    CGFloat height = annotationPadding + annotationHeaderHeight + commentHeight + annotationPadding;
    return height;
}

#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AnnotatedPhotoCell *cell = (AnnotatedPhotoCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    Photo *photo = self.photos[indexPath.row];
    [cell setsPhoto:photo];
    //[cell setPhoto:self.photos[indexPath.row]];
    
    return cell;
}


@end
