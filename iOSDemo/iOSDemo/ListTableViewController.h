//
//  ListTableViewController.h
//  iOSDemo
//
//  Created by Netease on 15/12/28.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PendingOperations.h"
#import "ImageDownloader.h"
#import "ImageFiltration.h"

@interface ListTableViewController : UITableViewController
@property (nonatomic) NSURL* dataSourceURL;
@property (nonatomic, strong) NSMutableArray *photos;
@property (nonatomic, strong) PendingOperations *pendingOperations;
@end
