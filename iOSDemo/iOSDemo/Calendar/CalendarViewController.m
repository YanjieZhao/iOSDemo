//
//  CalendarViewController.m
//  iOSDemo
//
//  Created by Yanjie on 16/5/9.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "CalendarViewController.h"
@import EventKitUI;

@interface CalendarViewController () <EKEventViewDelegate, EKEventEditViewDelegate>
- (IBAction)createClick:(id)sender;
- (IBAction)deleteClick:(id)sender;
- (IBAction)editClick:(id)sender;

@end

@implementation CalendarViewController
EKEventStore *myEventStore;
- (void)viewDidLoad {
    [super viewDidLoad];
    myEventStore = [[EKEventStore alloc] init];
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

- (IBAction)createClick:(id)sender {
    [myEventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
        EKEventEditViewController* controller = [[EKEventEditViewController alloc] init];
        controller.eventStore = myEventStore;
        controller.editViewDelegate = self;
        [self presentViewController:controller animated:YES completion:nil];
    }];
    
    
}
- (IBAction)deleteClick:(id)sender {
}

- (IBAction)editClick:(id)sender {
}

- (void)eventViewController:(EKEventViewController *)controller didCompleteWithAction:(EKEventViewAction)action
{
    
}

- (void)eventEditViewController:(EKEventEditViewController *)controller didCompleteWithAction:(EKEventEditViewAction)action
{
    NSLog(@"%@", controller.event.eventIdentifier);
    [controller dismissViewControllerAnimated:YES completion:nil];
}
@end
