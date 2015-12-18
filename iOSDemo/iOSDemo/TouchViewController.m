//
//  TouchViewController.m
//  iOSDemo
//
//  Created by Netease on 15/12/18.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import "TouchViewController.h"
#import <UIKit/UIKit.h>
#if DEBUG
#import "FLEXManager.h"
#endif

@interface TouchViewController ()@end

@implementation TouchViewController

- (void)viewDidLoad {
    self.sampleData = [NSArray arrayWithObjects:@"Small", @"Medium", @"Large", nil];
    
#if DEBUG
    [[FLEXManager sharedManager] showExplorer];
#endif
    [super viewDidLoad];
    [self registerForPreviewingWithDelegate:self sourceView:self.view];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addFirstItem:(id)sender {
    UIApplicationShortcutIcon *ticon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare];
    UIApplicationShortcutItem *item = [[UIApplicationShortcutItem alloc] initWithType:@"UIApplicationShortcutIconTypeSearch" localizedTitle:@"Share" localizedSubtitle:@"share" icon:ticon userInfo:nil];
    [UIApplication sharedApplication].shortcutItems = [NSArray arrayWithObjects:item, nil];
    NSLog(@"%@", item);
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    }
    id content = [self.sampleData objectAtIndex:indexPath.row];
    NSLog(@"%@", content);
    cell.textLabel.text = content;//(NSString*)[self.sampleData objectAtIndex:indexPath.row];
    return cell;
}
-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"NetworkStatusStoryboard" bundle:nil];
    UIViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:@"NetworkStatusViewController"];
    viewController.preferredContentSize = CGSizeMake(0.0, 300.f);
    [previewingContext setSourceRect:cell.frame];
    return viewController;
    
}
-(void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    [self showViewController:viewControllerToCommit sender:self];
}
@end
