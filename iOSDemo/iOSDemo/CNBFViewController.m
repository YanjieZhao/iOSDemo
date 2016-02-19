//
//  CNBFViewController.m
//  iOSDemo
//
//  Created by Netease on 16/1/20.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "CNBFViewController.h"

@interface CNBFViewController ()

@end

@implementation CNBFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self styleNavBar];
}

- (void)styleNavBar {
    // 1. hide the existing nav bar
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
//    return;
    // 2. create a new nav bar and style it
    self.navigationController.navigationBar.hidden = YES;
    UINavigationBar *newNavBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 64.0)];
    [newNavBar setTintColor:[UIColor whiteColor]];
    
    // 3. add a new navigation item w/title to the new nav bar
    UINavigationItem *newItem = [[UINavigationItem alloc] init];
    newItem.title = @"Paths";
    [newNavBar setItems:@[newItem]];
    
    // 4. add the nav bar to the main view
    [self.view addSubview:newNavBar];
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

@end
