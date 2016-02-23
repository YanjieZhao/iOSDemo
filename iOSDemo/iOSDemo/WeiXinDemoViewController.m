//
//  WeiXinDemoViewController.m
//  iOSDemo
//
//  Created by Netease on 16/2/2.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "WeiXinDemoViewController.h"
#import "Mantle.h"
#import "AppDelegate.h"

@interface WeiXinDemoViewController ()
- (IBAction)textShareClick:(id)sender;
- (IBAction)loginClick:(id)sender;

@end

@implementation WeiXinDemoViewController

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

- (IBAction)textShareClick:(id)sender {
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.text = @"fenxiang";
    req.bText = YES;
    req.scene = WXSceneSession;
    [WXApi sendReq:req];
}

- (IBAction)loginClick:(id)sender {
    SendAuthReq *req = [[SendAuthReq alloc] init];
    req.scope = @"snsapi_userinfo";
    req.state = @"123";
    [WXApi sendReq:req];
    
    NSString *token = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).weixinDelegate.token;
    NSLog(@"token %@", token);
}
@end
