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

@interface popwordsClass : MTLModel<MTLJSONSerializing>
@property (nonatomic, copy) NSString * template;
@property (nonatomic, copy) NSString * words;
@end

@interface searchClass : MTLModel<MTLJSONSerializing>
@property (nonatomic, strong) childListClass * child;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, assign) NSNumber*  type;
@property (nonatomic, strong) popwordsClass * popwords;
@end

@interface bannersListClass : MTLModel<MTLJSONSerializing>
@property (nonatomic, copy) NSString * sTag;
@property (nonatomic, copy) NSString * p_id;
@property (nonatomic, assign) NSNumber*  p_action;
@property (nonatomic, copy) NSString * id;
@property (nonatomic, copy) NSString * mode;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * cover;
@property (nonatomic, assign) NSNumber*  msgId;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * url;
@property (nonatomic, copy) NSString * style;
@property (nonatomic, copy) NSString * type;
@end


@interface barsListClass : MTLModel<MTLJSONSerializing>
@property (nonatomic, assign) NSNumber*  msgId;
@property (nonatomic, assign) NSNumber*  p_action;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * cover;
@property (nonatomic, copy) NSString * url;
@property (nonatomic, copy) NSString * p_id;
@end

@interface chainListClass : MTLModel<MTLJSONSerializing>
@end

@interface labelsListClass : MTLModel<MTLJSONSerializing>
@end

@interface bookClass : MTLModel<MTLJSONSerializing>
@property (nonatomic, assign) NSNumber*  style;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, assign) NSNumber*  nwprice;
@property (nonatomic, assign) NSNumber*  integrity;
@property (nonatomic, assign) NSNumber*  reduce_begin;
@property (nonatomic, copy) NSString * category;
@property (nonatomic, copy) NSString * cover;
@property (nonatomic, copy) NSString * iap_id;
@property (nonatomic, assign) NSNumber*  d_begin;
@property (nonatomic, copy) NSString * id;
@property (nonatomic, assign) NSNumber*  payment;
@property (nonatomic, assign) NSNumber*  wprice;
@property (nonatomic, assign) NSNumber*  d_end;
@property (nonatomic, copy) NSString * sTag;
@property (nonatomic, assign) NSNumber*  nprice;
@property (nonatomic, assign) NSNumber*  reduce_end;
@property (nonatomic, assign) NSNumber*  vip;
@property (nonatomic, assign) NSNumber*  iap_price;
@property (nonatomic, assign) NSNumber*  price;
@property (nonatomic, assign) NSNumber*  p_action;
@property (nonatomic, copy) NSString * author;
@property (nonatomic, copy) NSString * content;
@end

@interface listListClass : MTLModel<MTLJSONSerializing>
@property (nonatomic, strong) bookClass * book;
@end

@interface newsRecomListListClass : MTLModel<MTLJSONSerializing>
@property (nonatomic, copy) NSString * sTag;
@property (nonatomic, copy) NSString * id;
@property (nonatomic, copy) NSString * pic;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, assign) NSNumber*  head;
@property (nonatomic, assign) NSNumber*  type;
@property (nonatomic, copy) NSString * template;
@property (nonatomic, copy) NSString * url;
@end

@interface bookListListClass : MTLModel<MTLJSONSerializing>
@property (nonatomic, copy) NSString * author;
@property (nonatomic, copy) NSString * content;
@property (nonatomic, assign) NSNumber*  p_action;
@property (nonatomic, copy) NSString * id;
@property (nonatomic, copy) NSString * sTag;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * cover;
@end

@interface baoyueListClass : MTLModel<MTLJSONSerializing>
@property (nonatomic, copy) NSString * discount;
@property (nonatomic, copy) NSString * id;
@property (nonatomic, assign) NSNumber*  subscribed;
@property (nonatomic, strong) bookListListClass * bookList;
@property (nonatomic, assign) NSNumber*  count;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, assign) NSNumber*  price;
@property (nonatomic, copy) NSString * summary;
@property (nonatomic, copy) NSString * cover;
@property (nonatomic, copy) NSString * sTag;
@property (nonatomic, assign) NSNumber*  baoyueType;
@property (nonatomic, assign) NSNumber*  totalValue;
@property (nonatomic, assign) NSNumber*  p_action;
@end

@interface recommendsListClass : MTLModel<MTLJSONSerializing>
@property (nonatomic, assign) NSNumber*  module;
@property (nonatomic, strong) bannersListClass * banners;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, strong) barsListClass * bars;
@property (nonatomic, strong) chainListClass * chain;
@property (nonatomic, copy) NSString * sTag;
@property (nonatomic, assign) NSNumber*  p_action;
@property (nonatomic, copy) NSString * p_id;
@property (nonatomic, copy) NSString * more_name;
@property (nonatomic, strong) labelsListClass * labels;
@property (nonatomic, copy) NSString * more_url;
@property (nonatomic, strong) listListClass * list;
@property (nonatomic, copy) NSString * icon;
@property (nonatomic, strong) newsRecomListListClass * newsRecomList;
@property (nonatomic, strong) baoyueListClass * baoyue;
@end
@interface RootObject : MTLModel<MTLJSONSerializing>
@property (nonatomic, copy) NSString * baseurl;
@property (nonatomic, strong) searchClass * search;
@property (nonatomic, strong) recommendsListClass * recommends;
@end