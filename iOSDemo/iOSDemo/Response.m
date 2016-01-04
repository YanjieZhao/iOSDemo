//
//  Response.m
//  iOSDemo
//
//  Created by Netease on 16/1/4.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "Response.h"

@implementation Response
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"bookList" : @"list",
             @"isSuccess" : @"success"
             };
}
+(NSValueTransformer *)bookListJSONTransformer{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSArray *list){
        NSMutableArray *books = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in list) {
            Categray* c = [MTLJSONAdapter modelOfClass:[Categray class] fromJSONDictionary:dict error:nil];
            [books addObject:c];
        }
        return books;
    } reverseBlock:^(NSArray *date){
        NSMutableArray *dataList = [[NSMutableArray alloc] init];
        for (Categray *c in date) {
            NSDictionary *dict = [MTLJSONAdapter JSONDictionaryFromModel:c];
            [dataList addObject:dict];
        }
        return dataList;
    }];
}
@end
