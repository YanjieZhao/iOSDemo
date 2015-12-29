//
//  ImageFiltration.h
//  iOSDemo
//
//  Created by Netease on 15/12/29.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoOperations.h"

@interface ImageFiltration : NSOperation
@property (nonatomic) PhotoRecord *photoRecord;
-(instancetype)init:(PhotoRecord *)photo;
@end
