//
//  FileIOViewController.h
//  iOSDemo
//
//  Created by Netease on 15/12/23.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FileIOViewController : UIViewController
- (IBAction)handleEmbedFile:(id)sender;
- (IBAction)handleCStyleFile:(id)sender;
- (IBAction)handleNSStyleFile:(id)sender;
- (IBAction)folderClick:(id)sender;
- (IBAction)createFolder:(id)sender;
- (IBAction)plistAction:(id)sender;
- (IBAction)userDefaultAction:(id)sender;

@end
