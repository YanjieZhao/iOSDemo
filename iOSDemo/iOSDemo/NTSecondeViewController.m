//
//  NTSecondeViewController.m
//  iOSDemo
//
//  Created by Netease on 16/1/20.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "NTSecondeViewController.h"

@interface NTSecondeViewController ()
- (IBAction)backClick:(id)sender;

@end

@implementation NTSecondeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)backClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
