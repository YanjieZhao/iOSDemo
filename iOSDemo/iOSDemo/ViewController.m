//
//  ViewController.m
//  iOSDemo
//
//  Created by Netease on 15/12/17.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "NetworkStatusViewController.h"
#import "TouchViewController.h"
#import "FileIOViewController.h"
#import "RootViewController.h"
#import "SDWebImageTableViewController.h"
#import "FMDBViewController.h"
#import "MantleDemoViewController.h"
#import "MyTableViewController.h"
#import "URLSessionViewController.h"
#import "WeiXinDemoViewController.h"
#import "KeyboardDemoViewController.h"

@interface ViewController ()
- (IBAction)navigationTransClick:(id)sender;
- (IBAction)urlSessionClick:(id)sender;
- (IBAction)weiXinClick:(id)sender;
- (IBAction)keyboardDemoClick:(id)sender;
- (IBAction)animationClick:(id)sender;

@end

@implementation ViewController
- (IBAction)tableviewClick:(id)sender {
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"TableViewDemoStoryboard" bundle:nil];
    MyTableViewController *controller = [story instantiateViewControllerWithIdentifier:@"MyTableViewController"];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //UIApplicationShortcutItem* item = [[UIApplicationShortcutItem alloc] initWithType:UIApplicationShortcutIconTypeAdd localizedTitle:@"Add"];
    
    
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

- (IBAction)networkStatus:(id)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"NetworkStatusStoryboard" bundle:nil];
    UIViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:@"NetworkStatusViewController"];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)touchClick:(id)sender {
    TouchViewController *controller = [[TouchViewController alloc] init];
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)fileIOClick:(id)sender {
    FileIOViewController *controller = [[FileIOViewController alloc] init];
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)operationClick:(id)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"NSOperationStoryboard" bundle:nil];
    UIViewController *controller = [storyBoard instantiateViewControllerWithIdentifier:@"NSOperation"];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)uinavigationClick:(id)sender {
    RootViewController *controller = [[RootViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)sdWebImageClick:(id)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"SDWebImageStoryboard" bundle:nil];
    UIViewController *controller = [storyBoard instantiateViewControllerWithIdentifier:@"webimagecontroller"];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)fmdbClick:(id)sender {
    FMDBViewController *controller = [[FMDBViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)mantleClick:(id)sender {
    MantleDemoViewController *controller = [[MantleDemoViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}
- (IBAction)navigationTransClick:(id)sender {
    UIViewController *controller = [[UIStoryboard storyboardWithName:@"CustomNavBar" bundle:nil] instantiateViewControllerWithIdentifier:@"CustomNavBar"];
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)urlSessionClick:(id)sender {
    URLSessionViewController *controller = [[UIStoryboard storyboardWithName:@"NSURLSessionStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"URLSessionViewController"];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)weiXinClick:(id)sender {
    WeiXinDemoViewController *controller = [[WeiXinDemoViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}
UIImageView *imageView1;
- (IBAction)animationClick:(id)sender {
    if (imageView1 != nil) {
        [imageView1 removeFromSuperview];
    }
    UIImage *image = [UIImage imageNamed:@"01"];
    imageView1 = [[UIImageView alloc] initWithImage:image];
    
    CGRect frame = CGRectMake(50, 100, 200, 250);
    imageView1.frame = frame;
    
    UIImage *image2 = [UIImage imageNamed:@"02"];
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:image];
    imageView2.frame = frame;
    
    [self.view addSubview:imageView1];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        sleep(2);
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView transitionWithView:imageView1 duration:2.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{ /**  执行左翻转动画，*/
                // 从左边翻转 ， 之前设置显示图片1，翻转后显示图2 -》图片1 左翻转到最后显示图片2
                
                
                imageView1.image = [UIImage imageNamed:@"02"];
                
            } completion:^(BOOL finished) {
                
//                NSLog(@"completion");
//                
//                /** 左翻转动画 结束后， 停 1 秒后，再执行 右翻转动画 */
//                
//                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ // 停 1 秒后，再执行 右翻转动画
//                    
//                    [UIView transitionWithView:imageView1 duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{ // 然后，从右边翻转，翻转时显示图片1 -》图片2 右翻转最后显示图片1
//                        
//                        imageView1.image = [UIImage imageNamed:@"01"];
//                        
//                    } completion:nil];
//                    
//                });
            }];
        });
    });
    

- (IBAction)keyboardDemoClick:(id)sender {
    KeyboardDemoViewController *controller = [[KeyboardDemoViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}
@end
