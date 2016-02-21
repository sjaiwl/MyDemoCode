//
//  TitleTableView.m
//  OSXTest
//
//  Created by Appest on 15/10/27.
//  Copyright © 2015年 Appest Limited. All rights reserved.
//

#import "TitleTableView.h"
#import "MyAlertView.h"
#import "DataHolder.h"
#import "MyTableViewCell.h"
#import "MyTableHeaderView.h"
#import "MyTableRowView.h"

@interface TitleTableView ()<MyAlertViewDelegate,NSTableViewDataSource,NSTableViewDelegate>

@property (weak) IBOutlet NSTableView *titleView;

@end

@implementation TitleTableView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    //注册cell
    [self.titleView registerNib:[[NSNib alloc] initWithNibNamed:@"MyTableViewCell" bundle:nil] forIdentifier:@"myCell"];
    //设置数据源和代理
    self.titleView.delegate = self;
    self.titleView.dataSource = self;
    self.titleView.backgroundColor = [NSColor colorWithRed:0.85 green:0.89 blue:0.95 alpha:1.00];
    //设置头部
    self.titleView.headerView = nil;
}

- (IBAction)addTitleAction:(NSButton *)sender {
    //弹出框
    MyAlertView *alert = [[MyAlertView alloc] init];
    alert.view.frame = CGRectMake(0, 0, 200, 200);
    alert.delegate = self;
    [self presentViewControllerAsSheet:alert];
}

#pragma mark - MyAlertView代理
- (void)myAlertViewClickConfirmButton:(NSString *)text{
    [[DataHolder getInstance].dataDictionary setObject:[NSMutableArray new] forKey:text];
    [self.titleView reloadData];
}

#pragma mark - NSTableView数据源
//设置行数
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [[DataHolder getInstance].dataDictionary allKeys].count;
}

//设置cell的值
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    MyTableViewCell *myCell = [tableView makeViewWithIdentifier:@"myCell" owner:self];
    NSString *titleName = [[DataHolder getInstance].dataDictionary allKeys][row];
    myCell.nameInput.stringValue = titleName;
    return myCell;
}

//设置选中行
- (NSTableRowView *)tableView:(NSTableView *)tableView rowViewForRow:(NSInteger)row{
    NSLog(@"111");
    MyTableRowView *rowView = [[MyTableRowView alloc]init];
    return rowView;
}

//设置cell高度
- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row{
    return 40;
}

//点击事件
- (void)tableViewSelectionDidChange:(NSNotification *)notification{
    //获取
    NSInteger selectRow = [_titleView selectedRow];
    //发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TaskTableView_Refresh" object:[NSNumber numberWithInteger:selectRow] userInfo:nil];
}


#pragma mark - NSTableView编辑
//增加一行
- (void)tableView:(NSTableView *)tableView didAddRowView:(NSTableRowView *)rowView forRow:(NSInteger)row{
}

//删除一行
- (void)tableView:(NSTableView *)tableView didRemoveRowView:(NSTableRowView *)rowView forRow:(NSInteger)row{
    
}

@end
