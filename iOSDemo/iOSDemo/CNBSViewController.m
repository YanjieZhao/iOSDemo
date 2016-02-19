//
//  CNBSViewController.m
//  iOSDemo
//
//  Created by Netease on 16/1/20.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "CNBSViewController.h"

@interface CNBSViewController ()

@end

@implementation CNBSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self styleNavBar];
    
//    __weak id weakSelf = self;
//    self.navigationController.interactivePopGestureRecognizer.delegate = weakSelf;
}

- (void)styleNavBar {
    [self.navigationController setNavigationBarHidden:YES animated:NO];
//    return;
    self.navigationController.navigationBar.hidden = YES;
    UINavigationBar *newNavBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 64.0)];
    [newNavBar setTintColor:[UIColor whiteColor]];
    UINavigationItem *newItem = [[UINavigationItem alloc] init];
    newItem.title = @"Paths";
    
    // BackButtonBlack is an image we created and added to the app’s asset catalog
    UIImage *backButtonImage = [UIImage imageNamed:@"ipad.jpg"];
    
    // any buttons in a navigation bar are UIBarButtonItems, not just regular UIButtons. backTapped: is the method we’ll call when this button is tapped
    //UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(backTapped:)];
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"T" style:UIBarButtonItemStylePlain target:self action:@selector(backTapped:)];
    // the bar button item is actually set on the navigation item, not the navigation bar itself.
    newItem.leftBarButtonItem = backBarButtonItem;
    
    [newNavBar setItems:@[newItem]];
    [self.view addSubview:newNavBar];
}

- (void)backTapped:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
