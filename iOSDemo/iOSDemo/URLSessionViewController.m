//
//  URLSessionViewController.m
//  iOSDemo
//
//  Created by Netease on 16/1/27.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "URLSessionViewController.h"
#import "URLSessionDelegate.h"

@interface URLSessionViewController ()
- (IBAction)sessionCacheClick:(id)sender;

@end

@implementation URLSessionViewController

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

- (IBAction)sessionCacheClick:(id)sender {
    URLSessionDelegate *delegate = [[URLSessionDelegate alloc] init];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.baidu.com"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    NSURLSessionConfiguration *confige = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:confige delegate:delegate delegateQueue:[NSOperationQueue mainQueue]];
    [[session dataTaskWithRequest:request] resume];
    
}
@end
