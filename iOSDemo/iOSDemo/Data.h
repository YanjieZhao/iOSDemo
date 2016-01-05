//
//  Data.h
//  iOSDemo
//
//  Created by Netease on 16/1/5.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

@interface childListClass : MTLModel<MTLJSONSerializing>
@property (nonatomic, copy) NSString * hinturl;
@property (nonatomic, copy) NSString * extype;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * url;
@end
#pragma mark - <#ViewController overrides#>
@interface popwordsClass : MTLModel<MTLJSONSerializing>
@property (nonatomic, copy) NSString * template;
@property (nonatomic, copy) NSString * words;
@end
@interface searchClass : MTLModel<MTLJSONSerializing>
@property (nonatomic, strong) NSArray * child;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, assign) id type;
@property (nonatomic, assign) popwordsClass* popwords;
@end
@interface bannersListClass : MTLModel<MTLJSONSerializing>
@property (nonatomic, copy) NSString * sTag;
@property (nonatomic, copy) NSString * p_id;
@property (nonatomic, assign) id p_action;
@property (nonatomic, copy) NSString * id;
@property (nonatomic, copy) NSString * mode;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * cover;
@property (nonatomic, assign) id msgId;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * url;
@end


@interface barsListClass : MTLModel<MTLJSONSerializing>
@property (nonatomic, copy) NSString * url;
@property (nonatomic, assign) id msgId;
@property (nonatomic, assign) id p_action;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * cover;
@property (nonatomic, copy) NSString * p_id;
@end

@interface bookClass : MTLModel<MTLJSONSerializing>
@property (nonatomic, assign) id style;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, assign) id nwprice;
@property (nonatomic, assign) id integrity;
@property (nonatomic, assign) id reduce_begin;
@property (nonatomic, copy) NSString * category;
@property (nonatomic, copy) NSString * cover;
@property (nonatomic, copy) NSString * iap_id;
@property (nonatomic, assign) id d_begin;
@property (nonatomic, copy) NSString * id;
@property (nonatomic, assign) id payment;
@property (nonatomic, assign) id wprice;
@property (nonatomic, assign) id d_end;
@property (nonatomic, copy) NSString * sTag;
@property (nonatomic, assign) id nprice;
@property (nonatomic, assign) id reduce_end;
@property (nonatomic, assign) id vip;
@property (nonatomic, assign) id iap_price;
@property (nonatomic, assign) id price;
@property (nonatomic, assign) id p_action;
@property (nonatomic, copy) NSString * author;
@property (nonatomic, copy) NSString * content;
@end
@interface listListClass : MTLModel<MTLJSONSerializing>
@property (nonatomic, strong) bookClass* book;
@end

@interface recommendsListClass : MTLModel<MTLJSONSerializing>
@property (nonatomic, assign) id module;
@property (nonatomic, assign) NSArray * labels;
@property (nonatomic, assign) id p_action;
@property (nonatomic, copy) NSString * more_name;
@property (nonatomic, copy) NSString * p_id;
@property (nonatomic, copy) NSString * sTag;
@property (nonatomic, copy) NSString * more_url;
@property (nonatomic, copy) NSArray * list;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSArray * bars;
@property (nonatomic, copy) NSArray * chain;
@property (nonatomic, copy) NSString * icon;
@property (nonatomic, copy) NSArray * newsRecomList;
@property (nonatomic, strong) NSArray * baoyue;
@property (nonatomic, assign) NSArray * banners;
@end

@interface newsRecomListListClass : MTLModel<MTLJSONSerializing>
@property (nonatomic, copy) NSString * sTag;
@property (nonatomic, copy) NSString * id;
@property (nonatomic, copy) NSString * pic;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, assign) id head;
@property (nonatomic, assign) id type;
@property (nonatomic, copy) NSString * template;
@property (nonatomic, copy) NSString * url;
@end
@interface bookListListClass : MTLModel<MTLJSONSerializing>
@property (nonatomic, copy) NSString * author;
@property (nonatomic, copy) NSString * content;
@property (nonatomic, assign) id p_action;
@property (nonatomic, copy) NSString * id;
@property (nonatomic, copy) NSString * sTag;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * cover;
@end
@interface baoyueListClass : MTLModel<MTLJSONSerializing>
@property (nonatomic, copy) NSString * discount;
@property (nonatomic, copy) NSString * id;
@property (nonatomic, assign) id subscribed;
@property (nonatomic, assign) NSArray * bookList;
@property (nonatomic, assign) id count;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, assign) id price;
@property (nonatomic, copy) NSString * summary;
@property (nonatomic, copy) NSString * cover;
@property (nonatomic, copy) NSString * sTag;
@property (nonatomic, assign) id baoyueType;
@property (nonatomic, assign) id totalValue;
@property (nonatomic, assign) id p_action;
@end

@interface RootObject : MTLModel<MTLJSONSerializing>
@property (nonatomic, copy) NSString * baseurl;
@property (nonatomic, copy) searchClass* search;
@property (nonatomic, copy) NSArray * recommends;
@end
