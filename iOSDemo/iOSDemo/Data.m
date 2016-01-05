//
//  Data.m
//  iOSDemo
//
//  Created by Netease on 16/1/5.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "Data.h"
@implementation childListClass
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return
    @{
      @"hinturl":@"hinturl",
      @"extype":@"extype",
      @"name":@"name",
      @"url":@"url"
      };
}
@end

@implementation popwordsClass
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return
    @{
      @"template":@"template",
      @"words":@"words"
      };
}
@end
@implementation searchClass
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return
    @{
      @"child":@"child",
      @"name":@"name",
      @"type":@"type",
      @"popwords":@"popwords"
      };
}
@end
@implementation bannersListClass
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return
    @{
      @"sTag":@"sTag",
      @"p_id":@"p_id",
      @"p_action":@"p_action",
      @"id":@"id",
      @"mode":@"mode",
      @"title":@"title",
      @"cover":@"cover",
      @"msgId":@"msgId",
      @"name":@"name",
      @"url":@"url"
      };
}
@end

@implementation recommendsListClass
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return
    @{
      @"more_url":@"more_url",
      @"sTag":@"sTag",
      @"module":@"module",
      @"name":@"name",
      @"list":@"list",
      @"more_name":@"more_name",
      @"module":@"module",
      @"labels":@"labels",
      @"p_action":@"p_action",
      @"p_id":@"p_id",
      @"bars":@"bars",
      @"chain":@"chain",
      @"icon":@"icon",
      @"newsRecomList":@"newsRecomList",
      @"baoyue":@"baoyue",
      @"banners":@"banners"
      };
}
@end

@implementation barsListClass
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return
    @{
      @"url":@"url",
      @"msgId":@"msgId",
      @"p_action":@"p_action",
      @"name":@"name",
      @"cover":@"cover",
      @"p_id":@"p_id"
      };
}
@end

@implementation bookClass
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return
    @{
      @"style":@"style",
      @"title":@"title",
      @"nwprice":@"nwprice",
      @"integrity":@"integrity",
      @"reduce_begin":@"reduce_begin",
      @"category":@"category",
      @"cover":@"cover",
      @"iap_id":@"iap_id",
      @"d_begin":@"d_begin",
      @"id":@"id",
      @"payment":@"payment",
      @"wprice":@"wprice",
      @"d_end":@"d_end",
      @"sTag":@"sTag",
      @"nprice":@"nprice",
      @"reduce_end":@"reduce_end",
      @"vip":@"vip",
      @"iap_price":@"iap_price",
      @"price":@"price",
      @"p_action":@"p_action",
      @"author":@"author",
      @"content":@"content"
      };
}
@end
@implementation listListClass
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return
    @{
      @"book":@"book"
      };
}
@end
@implementation newsRecomListListClass
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return
    @{
      @"sTag":@"sTag",
      @"id":@"id",
      @"pic":@"pic",
      @"title":@"title",
      @"head":@"head",
      @"type":@"type",
      @"template":@"template",
      @"url":@"url"
      };
}
@end
@implementation bookListListClass
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return
    @{
      @"author":@"author",
      @"content":@"content",
      @"p_action":@"p_action",
      @"id":@"id",
      @"sTag":@"sTag",
      @"title":@"title",
      @"cover":@"cover"
      };
}
@end
@implementation baoyueListClass
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return
    @{
      @"discount":@"discount",
      @"id":@"id",
      @"subscribed":@"subscribed",
      @"bookList":@"bookList",
      @"count":@"count",
      @"title":@"title",
      @"price":@"price",
      @"summary":@"summary",
      @"cover":@"cover",
      @"sTag":@"sTag",
      @"baoyueType":@"baoyueType",
      @"totalValue":@"totalValue",
      @"p_action":@"p_action"
      };
}
@end
@implementation RootObject
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return
    @{
      @"baseurl":@"baseurl",
      @"search":@"search",
      @"recommends":@"recommends"
      };
}
+(NSValueTransformer *)searchJSONTransformer{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSDictionary *list){
        searchClass* c = [MTLJSONAdapter modelOfClass:[searchClass class] fromJSONDictionary:list error:nil];
        return c;
    } reverseBlock:^(NSArray *date){
        NSMutableArray *dataList = [[NSMutableArray alloc] init];
        for (searchClass *c in date) {
            NSDictionary *dict = [MTLJSONAdapter JSONDictionaryFromModel:c];
            [dataList addObject:dict];
        }
        return dataList;
    }];
}
+(NSValueTransformer *)recommendsJSONTransformer{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSArray *list){
        NSMutableArray *books = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in list) {
            recommendsListClass* c = [MTLJSONAdapter modelOfClass:[recommendsListClass class] fromJSONDictionary:dict error:nil];
            [books addObject:c];
        }
        return books;
    } reverseBlock:^(NSArray *date){
        NSMutableArray *dataList = [[NSMutableArray alloc] init];
        for (recommendsListClass *c in date) {
            NSDictionary *dict = [MTLJSONAdapter JSONDictionaryFromModel:c];
            [dataList addObject:dict];
        }
        return dataList;
    }];
}
@end

