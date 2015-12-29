//
//  PendingOperations.m
//  iOSDemo
//
//  Created by Netease on 15/12/29.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import "PendingOperations.h"

@implementation PendingOperations
-(instancetype)init{
    self = [super init];
    if (self != nil) {
        self.downloadQueue = [[NSOperationQueue alloc] init];
        self.downloadQueue.name = @"Download queue";
        self.downloadQueue.maxConcurrentOperationCount = 5;
        
        self.filtrationQueue = [[NSOperationQueue alloc] init];
        self.filtrationQueue.name = @"Image Filtration queue";
        self.filtrationQueue.maxConcurrentOperationCount = 2;
        
        self.downloadsInProgress = [[NSMutableDictionary alloc] init];
        self.filtrationsInProgress = [[NSMutableDictionary alloc] init];
    }
    return self;
}
@end
