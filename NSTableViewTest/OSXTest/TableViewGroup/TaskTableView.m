//
//  TaskTableView.m
//  OSXTest
//
//  Created by Appest on 15/10/27.
//  Copyright © 2015年 Appest Limited. All rights reserved.
//

#import "TaskTableView.h"
#import "MyAlertView.h"
#import "DataHolder.h"

@interface TaskTableView ()<MyAlertViewDelegate,NSTableViewDataSource,NSTableViewDelegate>

@property (weak) IBOutlet NSTableView *taskView;
@property (assign) NSInteger titleSelectedRow;

@end

@implementation TaskTableView

- (void)dealloc{
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(commitRefresh:) name:@"TaskTableView_Refresh" object:nil];
    //数据初始化
    self.titleSelectedRow = -1;
    // Do view setup here.
    self.taskView.dataSource = self;
    self.taskView.delegate = self;
    //设置头部
    self.taskView.headerView = nil;
}
//添加任务
- (IBAction)addTask:(NSButton *)sender {
    if (_titleSelectedRow >= 0) {
        //弹出框
        MyAlertView *alert = [[MyAlertView alloc] init];
        alert.view.frame = CGRectMake(0, 0, 200, 200);
        alert.delegate = self;
        [self presentViewControllerAsSheet:alert];
    }
}

#pragma mark - NSTableView数据源
//设置行数
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    //如果有选中项
    if (self.titleSelectedRow >= 0) {
        NSArray *titleArray = [[DataHolder getInstance].dataDictionary allKeys];
        NSArray *taskArrayForOneTitle = [[DataHolder getInstance].dataDictionary objectForKey:titleArray[_titleSelectedRow]];
        return taskArrayForOneTitle.count;
    }
    return 0;
}
//设置cell值
- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    //如果有选中项
    if (self.titleSelectedRow >= 0) {
        NSArray *titleArray = [[DataHolder getInstance].dataDictionary allKeys];
        NSArray *taskArrayForOneTitle = [[DataHolder getInstance].dataDictionary objectForKey:titleArray[_titleSelectedRow]];
        return taskArrayForOneTitle[row];
    }
    return nil;
}
//设置cell高度
- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row{
    return 30;
}

#pragma mark - MyAlertView代理
- (void)myAlertViewClickConfirmButton:(NSString *)text{
    NSArray *titleArray = [[DataHolder getInstance].dataDictionary allKeys];
    NSMutableArray *taskArrayForOneTitle = [[DataHolder getInstance].dataDictionary objectForKey:titleArray[_titleSelectedRow]];
    [taskArrayForOneTitle addObject:text];
    [self.taskView reloadData];
}

#pragma mark - 通知处理事件
- (void)commitRefresh:(NSNotification *)notification{
    //获取选中行
    NSNumber *select = [notification object];
    //赋值
    self.titleSelectedRow = select.integerValue;
    //刷新数据
    [self.taskView reloadData];
}
@end
