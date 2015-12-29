//
//  PendingOperations.h
//  iOSDemo
//
//  Created by Netease on 15/12/29.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PendingOperations : NSObject
@property (nonatomic) NSMutableDictionary *downloadsInProgress;
@property (nonatomic) NSOperationQueue *downloadQueue;
@property (nonatomic) NSMutableDictionary *filtrationsInProgress;
@property (nonatomic) NSOperationQueue *filtrationQueue;
@end
