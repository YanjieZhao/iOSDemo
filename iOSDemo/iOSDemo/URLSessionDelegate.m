//
//  URLSessionDelegate.m
//  iOSDemo
//
//  Created by Netease on 16/1/27.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "URLSessionDelegate.h"

@implementation URLSessionDelegate
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    return self;
}
- (void)encodeWithCoder:(NSCoder *)coder {
    //[coder encodeObject:self.session.configuration forKey:@"sessionConfiguration"];
}
- (instancetype)copyWithZone:(NSZone *)zone {
    return [[self class] allocWithZone:zone];
}

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    
}

-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask willCacheResponse:(NSCachedURLResponse *)proposedResponse completionHandler:(void (^)(NSCachedURLResponse * _Nullable))completionHandler{
    
}

+ (BOOL)supportsSecureCoding{
    return YES;
}
@end
