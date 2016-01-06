//
//  Data.m
//  iOSDemo
//
//  Created by Netease on 16/1/5.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "Data.h"
#import <Foundation/Foundation.h>
#import "Mantle.h"
@implementation childListClass
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return
  @{
    @"hinturl":@"hinturl",
    @"extype":@"extype",
    @"name":@"name",
    @"url":@"url"
    };
}@end
@implementation popwordsClass
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return
  @{
    @"template":@"template",
    @"words":@"words"
    };
}@end
@implementation searchClass
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return
  @{
    @"child":@"child",
    @"name":@"name",
    @"type":@"type",
    @"popwords":@"popwords"
    };
}+(NSValueTransformer *)childJSONTransformer
{
    return [MTLValueTransformer transformerWithBlock:^id(NSArray *array) {
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        for (id obj in array) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                childListClass * c = [MTLJSONAdapter modelOfClass:[childListClass class] fromJSONDictionary:obj error:nil];
                [temp addObject:c];
            }else{
                [temp addObject:obj];
            }
        }
        return temp;
    }];
}

+(NSValueTransformer *)popwordsJSONTransformer
{
    return [MTLValueTransformer transformerWithBlock:^id(NSDictionary *dict) {
        popwordsClass* obj = [MTLJSONAdapter modelOfClass:[popwordsClass class] fromJSONDictionary:dict error:nil];
        return obj;
    }];
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
    @"url":@"url",
    @"style":@"style",
    @"type":@"type"
    };
}@end
@implementation recommendsListClass
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return
  @{
    @"module":@"module",
    @"banners":@"banners",
    @"name":@"name",
    @"bars":@"bars",
    @"chain":@"chain",
    @"sTag":@"sTag",
    @"p_action":@"p_action",
    @"p_id":@"p_id",
    @"more_name":@"more_name",
    @"labels":@"labels",
    @"more_url":@"more_url",
    @"list":@"list",
    @"icon":@"icon",
    @"newsRecomList":@"newsRecomList",
    @"baoyue":@"baoyue"
    };
}+(NSValueTransformer *)bannersJSONTransformer
{
    return [MTLValueTransformer transformerWithBlock:^id(NSArray *array) {
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        for (id obj in array) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                bannersListClass * c = [MTLJSONAdapter modelOfClass:[bannersListClass class] fromJSONDictionary:obj error:nil];
                [temp addObject:c];
            }else{
                [temp addObject:obj];
            }
        }
        return temp;
    }];
}
+(NSValueTransformer *)barsJSONTransformer
{
    return [MTLValueTransformer transformerWithBlock:^id(NSArray *array) {
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        for (id obj in array) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                barsListClass * c = [MTLJSONAdapter modelOfClass:[barsListClass class] fromJSONDictionary:obj error:nil];
                [temp addObject:c];
            }else{
                [temp addObject:obj];
            }
        }
        return temp;
    }];
}
+(NSValueTransformer *)chainJSONTransformer
{
    return [MTLValueTransformer transformerWithBlock:^id(NSArray *array) {
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        for (id obj in array) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                chainListClass * c = [MTLJSONAdapter modelOfClass:[chainListClass class] fromJSONDictionary:obj error:nil];
                [temp addObject:c];
            }else{
                [temp addObject:obj];
            }
        }
        return temp;
    }];
}
+(NSValueTransformer *)labelsJSONTransformer
{
    return [MTLValueTransformer transformerWithBlock:^id(NSArray *array) {
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        for (id obj in array) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                labelsListClass * c = [MTLJSONAdapter modelOfClass:[labelsListClass class] fromJSONDictionary:obj error:nil];
                [temp addObject:c];
            }else{
                [temp addObject:obj];
            }
        }
        return temp;
    }];
}
+(NSValueTransformer *)listJSONTransformer
{
    return [MTLValueTransformer transformerWithBlock:^id(NSArray *array) {
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        for (id obj in array) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                listListClass * c = [MTLJSONAdapter modelOfClass:[listListClass class] fromJSONDictionary:obj error:nil];
                [temp addObject:c];
            }else{
                [temp addObject:obj];
            }
        }
        return temp;
    }];
}
+(NSValueTransformer *)newsRecomListJSONTransformer
{
    return [MTLValueTransformer transformerWithBlock:^id(NSArray *array) {
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        for (id obj in array) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                newsRecomListListClass * c = [MTLJSONAdapter modelOfClass:[newsRecomListListClass class] fromJSONDictionary:obj error:nil];
                [temp addObject:c];
            }else{
                [temp addObject:obj];
            }
        }
        return temp;
    }];
}
+(NSValueTransformer *)baoyueJSONTransformer
{
    return [MTLValueTransformer transformerWithBlock:^id(NSArray *array) {
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        for (id obj in array) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                baoyueListClass * c = [MTLJSONAdapter modelOfClass:[baoyueListClass class] fromJSONDictionary:obj error:nil];
                [temp addObject:c];
            }else{
                [temp addObject:obj];
            }
        }
        return temp;
    }];
}
@end
@implementation barsListClass
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return
  @{
    @"msgId":@"msgId",
    @"p_action":@"p_action",
    @"name":@"name",
    @"cover":@"cover",
    @"url":@"url",
    @"p_id":@"p_id"
    };
}@end
@implementation chainListClass
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return
  @{
    
    };
}@end
@implementation labelsListClass
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return
  @{
    
    };
}@end
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
}@end
@implementation listListClass
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return
  @{
    @"book":@"book"
    };
}
+(NSValueTransformer *)bookJSONTransformer
{
    return [MTLValueTransformer transformerWithBlock:^id(NSDictionary *dict) {
        bookClass* obj = [MTLJSONAdapter modelOfClass:[bookClass class] fromJSONDictionary:dict error:nil];
        return obj;
    }];
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
}@end
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
}@end
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
+(NSValueTransformer *)bookListJSONTransformer
{
    return [MTLValueTransformer transformerWithBlock:^id(NSArray *array) {
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        for (id obj in array) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                bookListListClass * c = [MTLJSONAdapter modelOfClass:[bookListListClass class] fromJSONDictionary:obj error:nil];
                [temp addObject:c];
            }else{
                [temp addObject:obj];
            }
        }
        return temp;
    }];
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
+(NSValueTransformer *)searchJSONTransformer
{
    return [MTLValueTransformer transformerWithBlock:^id(NSDictionary *dict) {
        searchClass* obj = [MTLJSONAdapter modelOfClass:[searchClass class] fromJSONDictionary:dict error:nil];
        return obj;
    }];
}
+(NSValueTransformer *)recommendsJSONTransformer
{
    return [MTLValueTransformer transformerWithBlock:^id(NSArray *array) {
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        for (id obj in array) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                recommendsListClass * c = [MTLJSONAdapter modelOfClass:[recommendsListClass class] fromJSONDictionary:obj error:nil];
                [temp addObject:c];
            }else{
                [temp addObject:obj];
            }
        }
        return temp;
    }];
}
@end