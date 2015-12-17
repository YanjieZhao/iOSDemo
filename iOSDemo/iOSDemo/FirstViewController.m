//
//  FirstViewController.m
//  iOSDemo
//
//  Created by Netease on 15/12/17.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "PopTransitioningDelegate.h"
#import <UIKit/UIKit.h>

@interface FirstViewController ()
- (IBAction)go:(id)sender;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.transitionDelegate = [[PopTransitioningDelegate alloc] init];
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
- (IBAction)go:(id)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"NavigationStoryboard" bundle:nil];
    
    SecondViewController *second= [storyBoard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    second.transitioningDelegate = self.transitionDelegate;
    [self presentViewController:second animated:YES completion:nil];
}
@end
