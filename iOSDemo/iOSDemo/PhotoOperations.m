//
//  PhotoOperations.m
//  iOSDemo
//
//  Created by Netease on 15/12/29.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import "PhotoOperations.h"

@implementation PhotoRecord
-(instancetype)init:(NSString *)name url:(NSURL *)url{
    self = [super init];
    if (self != nil) {
        self.name = name;
        self.url = url;
        self.image = [UIImage imageNamed:@"Placeholder"];
        self.state = New;
    }
    return self;
}
@end
