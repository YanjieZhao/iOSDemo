//
//  TheSecondViewController.m
//  iOSDemo
//
//  Created by Netease on 15/12/29.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import "TheSecondViewController.h"
#import "TheThirdViewController.h"

@interface TheSecondViewController ()

@end

@implementation TheSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)navigationClick:(id)sender {
    TheThirdViewController *controller = [[TheThirdViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}
@end
