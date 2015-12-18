//
//  TouchViewController.h
//  iOSDemo
//
//  Created by Netease on 15/12/18.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TouchViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIViewControllerPreviewingDelegate>
- (IBAction)addFirstItem:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSArray *sampleData;

@end
