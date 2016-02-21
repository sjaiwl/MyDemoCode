//
//  ViewController.m
//  ContainerViewControllerDemo
//
//  Created by Appest on 15/10/28.
//  Copyright © 2015年 Appest Limited. All rights reserved.
//

#import "ViewController.h"
#import "MyContainerViewController.h"

@interface ViewController ()

@property (strong) MyContainerViewController *containerVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //初始化容器视图
    self.containerVC = [[MyContainerViewController alloc] init];
    _containerVC.view.frame = self.view.bounds;
    //设置view自适应宽和高
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth
    |UIViewAutoresizingFlexibleHeight;
    //添加控制器
    [self addChildViewController:_containerVC];
    [self.view addSubview:_containerVC.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
