//
//  ViewController.m
//  OSXTest
//
//  Created by Appest on 15/10/26.
//  Copyright © 2015年 Appest Limited. All rights reserved.
//

#import "ViewController.h"
#import "TitleTableView.h"
#import "TaskTableView.h"

@interface ViewController()

@property (strong) TitleTableView *myTitleView;
@property (strong) TaskTableView *myTaskView;
@property (weak) IBOutlet NSSplitView *mySplitView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化视图
    [self setMyViewContent];
}

//视图设置
- (void)setMyViewContent{
    self.myTitleView = [[TitleTableView alloc] init];
    self.myTaskView = [[TaskTableView alloc] init];
    [self.mySplitView insertArrangedSubview:_myTitleView.view atIndex:1];
    [self.mySplitView insertArrangedSubview:_myTaskView.view atIndex:2];
    self.mySplitView.dividerStyle = NSSplitViewDividerStyleThin;
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
