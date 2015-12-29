//
//  ImageFiltration.m
//  iOSDemo
//
//  Created by Netease on 15/12/29.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import "ImageFiltration.h"

@implementation ImageFiltration
-(instancetype)init:(PhotoRecord *)photo{
    if ((self = [super init]) != nil){
        self.photoRecord = photo;
    }
    return self;
}

-(void)main{
    if (self.cancelled) {
        return;
    }
    if (self.photoRecord.state != Downloaded) {
        return;
    }
    UIImage *filteredImage = [self applySepiaFilter:self.photoRecord.image];
    if (filteredImage != nil) {
        self.photoRecord.image = filteredImage;
        self.photoRecord.state = Filtered;
    }
}

-(UIImage *)applySepiaFilter:(UIImage *)image{
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    CIContext *context = [[CIContext alloc] init];
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:0.8] forKey:@"inputIntensity"];
    id outputImage = filter.outputImage;
    struct CGImage *outImage = [context createCGImage:outputImage fromRect:[outputImage extent]];
    return [UIImage imageWithCGImage:outImage];
}
@end
