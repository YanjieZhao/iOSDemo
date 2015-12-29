//
//  ImageDownloader.m
//  iOSDemo
//
//  Created by Netease on 15/12/29.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import "ImageDownloader.h"


@implementation ImageDownloader
-(instancetype)init:(PhotoRecord *)photo{
    self = [super init];
    if (self != nil) {
        self.photoRecord = photo;
    }
    return self;
}
-(void)main{
    if (self.cancelled) {
        return;
    }
    
    NSData *imageData = [NSData dataWithContentsOfURL:self.photoRecord.url];
    if (self.cancelled) {
        return;
    }
    
    if (imageData.length > 0) {
        self.photoRecord.image = [UIImage imageWithData:imageData];
        self.photoRecord.state = Downloaded;
    }
    else
    {
        self.photoRecord.state = Failed;
        self.photoRecord.image = [UIImage imageNamed:@"Failed"];
    }
}
@end
