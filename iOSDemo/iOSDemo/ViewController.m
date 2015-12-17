//
//  ViewController.m
//  iOSDemo
//
//  Created by Netease on 15/12/17.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)navigationPage:(id)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"NavigationStoryboard" bundle:nil];
    
    FirstViewController *first= [storyBoard instantiateViewControllerWithIdentifier:@"FirstViewController"];
    [self presentViewController:first animated:YES completion:nil];
}

- (IBAction)interactive:(id)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"InteractiveTransitionStoryboard" bundle:nil];
    
    UINavigationController *naviController = [storyBoard instantiateViewControllerWithIdentifier:@"InteractiveTransitionNavigationController"];
    [self presentViewController:naviController animated:YES completion:nil];
}
@end
