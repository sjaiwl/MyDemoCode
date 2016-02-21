//
//  ViewController.m
//  CustomTransitionTest
//
//  Created by Appest on 15/10/28.
//  Copyright © 2015年 Appest Limited. All rights reserved.
//

#import "ViewController.h"
#import "MyViewController.h"

@interface ViewController ()

@property (nonatomic,strong) MyViewController *myController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myController = [[MyViewController alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)toMyView:(UIButton *)sender {
    self.myController.modalPresentationStyle = UIModalPresentationCustom;
    //设置代理
    self.myController.transitioningDelegate = self.myController;
    [self presentViewController:self.myController animated:YES completion:nil];
}


@end
