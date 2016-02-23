//
//  FMDBViewController.m
//  iOSDemo
//
//  Created by Netease on 16/1/4.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "FMDBViewController.h"
#import "FMDb.h"
#if DEBUG
#import "FLEXManager.h"
#endif

@interface FMDBViewController ()
@property (nonatomic, strong) FMDatabase *db;
@end

@implementation FMDBViewController

- (void)viewDidLoad {
#if DEBUG
    [[FLEXManager sharedManager] showExplorer];
#endif
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dbFileName = [path stringByAppendingPathComponent:@"sources.sqlite"];
    
    self.db = [FMDatabase databaseWithPath:dbFileName];
    
    if ([self.db open]) {
        BOOL result = [self.db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_source (id integer PRIMARY KEY AUTOINCREMENT, sourceId text NOT NULL, name text NOT NULL, summary text NOT NULL,  subscribed integer NOT NULL);"];
        if (!result) {
            NSLog(@"创建失败");
        }
        else
        {
            NSLog(@"创建成功");
        }
        
        [self.db executeUpdate:@"CREATE INDEX IF NOT EXISTS index_name on t_source(name)"];
    }
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
- (NSString *)getUniqueStrByUUID
{
    CFUUIDRef    uuidObj = CFUUIDCreate(nil);//create a new UUID
    
    //get the string representation of the UUID
    
    NSString    *uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(nil, uuidObj);
    
    CFRelease(uuidObj);
    return uuidString ;
}
- (IBAction)addClick:(id)sender {
    NSString *summary = @"在2013年3月21日苹果已经通知开发者，从2013年5月1日起，访问UIDID的应用将不再能通过审核，替代的方案是开发者应该使用“在iOS 6中介绍的Vendor或Advertising标示符。";
    for (int i = 0; i < 1; ++i) {
        summary = [summary stringByAppendingString:summary];
    }
    NSDate* startDate = [NSDate dateWithTimeIntervalSinceNow:0];
    [self.db beginTransaction];
    for (int i = 0; i < 40; i++) {
        NSString *sourceid = [self getUniqueStrByUUID];
        NSString *prexName = [NSString stringWithFormat:@"jack-%d", arc4random_uniform(1000000)];
        
        
        NSString *sql = [NSString stringWithFormat:@"INSERT INTO t_source (sourceId, name, summary, subscribed) VALUES ('%@', '%@', '%@', %d);", sourceid, [sourceid stringByAppendingString:prexName], summary, 1];
        BOOL result = [self.db executeUpdate:sql];
        if (!result) {
            NSLog(@"创建行失败");
        }
    }
    [self.db commit];
    NSDate* endDate = [NSDate dateWithTimeIntervalSinceNow:0];
    NSLog(@"%f", [endDate timeIntervalSince1970] - [startDate timeIntervalSince1970]);
}

- (IBAction)deleteClick:(id)sender {
    //实践确认：如果该行不存在，删除也会返回YES
    NSString *sql = @"DELETE FROM t_student WHERE id = 25";
    BOOL result = [self.db executeUpdate:sql];
    if (!result) {
        NSLog(@"删除失败");
    }
    else
    {
        NSLog(@"删除成功");
    }
}

- (IBAction)modifyClick:(id)sender {
    NSString *sql = @"UPDATE t_student SET name = 'jack' WHERE id = 100";
    BOOL result = [self.db executeUpdate:sql];
    if (result) {
        FMResultSet *resultSet = [self.db executeQuery:@"SELECT * FROM t_student WHERE id = 100"];
        [self printStudentSet:resultSet];
    }
}

- (IBAction)queryClick:(id)sender {
    FMResultSet *resultSet = [self.db executeQuery:@"SELECT * FROM t_source"];
    //[self printStudentSet:resultSet];
    
    //resultSet = [self.db executeQuery:@"SELECT * FROM t_student WHERE name = 'jack-871'"];
    [self printStudentSet:resultSet];
}

- (IBAction)performanceClick:(id)sender {
    NSString *sql = @"select * from t_source where id = 137";
    NSDate* startDate = [NSDate dateWithTimeIntervalSinceNow:0];
    FMResultSet *resultSet = [self.db executeQuery:sql];
    [self printStudentSet:resultSet];
    NSDate* endDate = [NSDate dateWithTimeIntervalSinceNow:0];
    NSLog(@"%f", [endDate timeIntervalSince1970] - [startDate timeIntervalSince1970]);
    
    sql = @"select * from t_source where name = 'B4372FA4-2FC7-46E6-9927-52DAE3E14FBFjack-710994'";
    NSDate* startDate1 = [NSDate dateWithTimeIntervalSinceNow:0];
    resultSet = [self.db executeQuery:sql];
    [self printStudentSet:resultSet];
    NSDate* endDate1 = [NSDate dateWithTimeIntervalSinceNow:0];
    NSLog(@"%f", [endDate1 timeIntervalSince1970] - [startDate1 timeIntervalSince1970]);
    
    sql = @"select * from t_source";
    NSDate* startDate2 = [NSDate dateWithTimeIntervalSinceNow:0];
    resultSet = [self.db executeQuery:sql];
    [self printStudentSet:resultSet];
    NSDate* endDate2 = [NSDate dateWithTimeIntervalSinceNow:0];
    NSLog(@"%f", [endDate2 timeIntervalSince1970] - [startDate2 timeIntervalSince1970]);

}

-(void)printStudentSet:(FMResultSet *)resultSet{
    while ([resultSet next]) {
        int ID = [resultSet intForColumn:@"id"];
        NSString *name = [resultSet stringForColumn:@"name"];
        NSString *sourceId = [resultSet stringForColumn:@"sourceId"];
        NSLog(@"%d %@ %@", ID, name, sourceId);
    }
}
//xxxxx
@end
