//
//  NetworkStatusViewController.m
//  iOSDemo
//
//  Created by Netease on 15/12/17.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import "NetworkStatusViewController.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

@interface NetworkStatusViewController ()

@end

@implementation NetworkStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CTTelephonyNetworkInfo *networkStatus = [[CTTelephonyNetworkInfo alloc] init];
    NSString *currentStatus = networkStatus.currentRadioAccessTechnology;
    
    NSString *type;
    if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyGPRS"]){
        type = @"GPRS网络";
    }
    if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyEdge"]){
        type = @"2.75G的EDGE网络";
    }
    if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyWCDMA"]){
        type = @"3G WCDMA网络";
    }
    if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyHSDPA"]){
        type = @"3.5G网络";
    }
    if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyHSUPA"]){
        type = @"3.5G网络";
    }
    if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMA1x"]){
        type = @"CDMA2G网络";
    }
    if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMAEVDORev0"]){
        type = @"CDMA的EVDORev0(应该算3G吧?)";
    }
    if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMAEVDORevA"]){
        type = @"CDMA的EVDORevA(应该也算3G吧?)";
    }
    if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMAEVDORevB"]){
        type = @"CDMA的EVDORev0(应该还是算3G吧?)";
    }
    if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyeHRPD"]){
        type = @"HRPD网络";
    }
    if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyLTE"]){
        type = @"LTE4G网络";
    }
    
    
    NSLog(@"%@-%@", type, networkStatus.subscriberCellularProvider.carrierName);
    
    _networkTypeLabel.text = type;
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
