//
//  MantleDemoViewController.m
//  iOSDemo
//
//  Created by Netease on 16/1/4.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "MantleDemoViewController.h"
#import "Response.h"
#import "Mantle.h"


@interface MantleDemoViewController ()
@property (nonatomic, strong) NSData *content;
@end

@implementation MantleDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.content = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://yuedu.163.com/bookCategoryInterface.do?catId=900&filter=hot&count=9"]];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:self.content options:NSJSONReadingMutableContainers error:nil];
    
    Response *response = [MTLJSONAdapter modelOfClass:[Response class] fromJSONDictionary:dict error:nil];
    NSLog(@"%@", response);
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
