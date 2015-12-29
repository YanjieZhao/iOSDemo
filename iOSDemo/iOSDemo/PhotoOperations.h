//
//  PhotoOperations.h
//  iOSDemo
//
//  Created by Netease on 15/12/29.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

enum PhotoRecordState{New, Downloaded, Filtered, Failed};

@interface PhotoRecord : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSURL *url;
@property (nonatomic) UIImage *image;
@property (nonatomic) enum PhotoRecordState state;

-(instancetype)init:(NSString *)name url:(NSURL *)url;
@end
