//
//  SecondViewController.m
//  ContainerViewControllerDemo
//
//  Created by Appest on 15/10/28.
//  Copyright © 2015年 Appest Limited. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor grayColor];
    NSLog(@"%s",__FUNCTION__);
}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"%s",__FUNCTION__);
}

- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"%s",__FUNCTION__);
}

- (void)viewDidLayoutSubviews{
    NSLog(@"%s",__FUNCTION__);
}

- (void)viewWillDisappear:(BOOL)animated{
    NSLog(@"%s",__FUNCTION__);
}

- (void)viewDidDisappear:(BOOL)animated{
    NSLog(@"%s",__FUNCTION__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)secondViewButton:(UIButton *)sender {
    NSLog(@"跳转到第一个页面");
    //发送通知,告知parentViewController切换
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ParentController_changeView" object:@"toFirst" userInfo:nil];
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
