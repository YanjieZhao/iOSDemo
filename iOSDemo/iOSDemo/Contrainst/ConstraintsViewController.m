//
//  ConstraintsViewController.m
//  iOSDemo
//
//  Created by Yanjie on 16/4/18.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "ConstraintsViewController.h"

@interface ConstraintsViewController ()
- (IBAction)constraintClick:(id)sender;

@end

@implementation ConstraintsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)constraintClick:(id)sender {
    NSLayoutConstraint *con = [NSLayoutConstraint constraintWithItem:sender attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:100];
    [self.view addConstraint:con];
    [UIView animateWithDuration:3.3f animations:^{
        [self.view layoutSubviews];
    }];
}
@end
