//
//  TouchMainViewController.m
//  iOSDemo
//
//  Created by 赵艳杰 on 16/1/28.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "TouchMainViewController.h"
#if DEBUG
#import "FLEXManager.h"
#endif

@interface TouchMainViewController ()

@end

@implementation TouchMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
#if DEBUG
    [[FLEXManager sharedManager] showExplorer];
#endif

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
