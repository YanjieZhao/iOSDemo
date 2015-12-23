//
//  FileIOViewController.m
//  iOSDemo
//
//  Created by Netease on 15/12/23.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import "FileIOViewController.h"
#if DEBUG
#import "FLEXManager.h"
#endif
@interface FileIOViewController ()

@end

@implementation FileIOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)handleEmbedFile:(id)sender {
    NSBundle *bundle = [NSBundle mainBundle];
    //"/"很重要
    NSString *path = [[bundle resourcePath] stringByAppendingString:@"/ipad.jpg"];
    NSLog(@"%@", path);
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSLog(@"%lu", (unsigned long)data.length);
    
    //NSString *str=[[NSBundle mainBundle] pathForResource:@"" ofType:@".jpg"];
    
    //NSData *fileData = [NSData dataWithContentsOfFile:str];
    
    NSString *writeFilePath = [[self documentPath] stringByAppendingPathComponent:@"ipad.jgp"];
    NSLog(@"%@", writeFilePath);
    
    [data writeToFile:writeFilePath atomically:YES];
}

- (IBAction)handleCStyleFile:(id)sender {
}

- (IBAction)handleNSStyleFile:(id)sender {
    NSString *path = [[self documentPath] stringByAppendingPathComponent:@"testFile"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager createFileAtPath:path contents:nil attributes:nil];
    
    NSString *content = @"test data";
    [content writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    NSString *ressult = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@", ressult);
    
    
    
    NSDictionary *atts = [fileManager attributesOfItemAtPath:path error:nil];

    for (int i = 0; i < atts.count; ++i) {
        NSLog(@"%@-%@", [[atts allKeys] objectAtIndex:i], [[atts allValues] objectAtIndex:i]);
    }
}

- (IBAction)folderClick:(id)sender {
    NSString *dirHome = NSHomeDirectory();
    NSLog(@"%@", dirHome);
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [path objectAtIndex:0];
    NSLog(@"%@", documentDirectory);
    
    path = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryDirectory = [path objectAtIndex:0];
    NSLog(@"%@", libraryDirectory);
    
    path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cache = [path objectAtIndex:0];
    NSLog(@"%@", cache);
    
    NSString *tempPath = NSTemporaryDirectory();
    NSLog(@"%@", tempPath);
}

- (IBAction)createFolder:(id)sender {
    NSString *path = [[self documentPath] stringByAppendingPathComponent:@"testFolder"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
}

- (IBAction)plistAction:(id)sender {
    NSMutableDictionary *content = [[NSMutableDictionary alloc] init];
    [content setObject:@"value" forKey:@"key"];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"test key", nil] forKeys:[NSArray arrayWithObjects:@"test value", nil]];
    [content setObject:dic forKey:@"dicKey"];
    
    NSString *path = [[self documentPath] stringByAppendingPathComponent:@"test.plist"];
    [content writeToFile:path atomically:YES];
    
    NSMutableDictionary *copy = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    NSLog(@"%@", copy);
}

- (IBAction)userDefaultAction:(id)sender {
    //NSUserDefaults支持的数据格式有：NSNumber（Integer、Float、Double），NSString，NSDate，NSArray，NSDictionary，BOOL
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSObject *obj = [defaults objectForKey:@"username"];
    NSLog(@"%@", [defaults objectForKey:@"aihao"]);
    [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"intkey"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    int value = [[NSUserDefaults standardUserDefaults] integerForKey:@"intkey"];
}

-(NSString *)documentPath{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [path objectAtIndex:0];
    return documentDirectory;
}
@end
