//
//  MyContainerViewController.m
//  ContainerViewControllerDemo
//
//  Created by Appest on 15/10/28.
//  Copyright © 2015年 Appest Limited. All rights reserved.
//

#import "MyContainerViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface MyContainerViewController ()

@property (strong) FirstViewController *first;
@property (strong) SecondViewController *second;

@end

@implementation MyContainerViewController

- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%s",__FUNCTION__);
    self.first = [[FirstViewController alloc] init];
    self.second = [[SecondViewController alloc] init];
    [self displayContentController:_first];
    //添加通知处理页面切换
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeView:) name:@"ParentController_changeView" object:nil];
}

- (void)changeView:(NSNotification *) notification{
    NSString *str = [notification object];
    NSLog(@"%@",str);
    if ([str isEqualToString:@"toFirst"]) {
        [self cycleFromViewController:_second toViewController:_first];
    }else{
        [self cycleFromViewController:_first toViewController:_second];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s",__FUNCTION__);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%s",__FUNCTION__);
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"%s",__FUNCTION__);
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"%s",__FUNCTION__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) displayContentController: (UIViewController*) content {
    //the addChildViewController: method calls the child’s willMoveToParentViewController:
    [self addChildViewController:content];
    content.view.frame = self.view.bounds;
    [self.view addSubview:content.view];
    [content didMoveToParentViewController:self];
}

- (void) hideContentController: (UIViewController*) content {
    [content willMoveToParentViewController:nil];
    [content.view removeFromSuperview];
    //The removeFromParentViewController method also calls the child’s didMoveToParentViewController: method, passing that method a value of nil.
    [content removeFromParentViewController];
}

- (void)cycleFromViewController: (UIViewController*) oldVC
               toViewController: (UIViewController*) newVC {
    // Prepare the two view controllers for the change.
    [oldVC willMoveToParentViewController:nil];
    [self addChildViewController:newVC];
    // Get the start frame of the new view controller and the end frame
    // for the old view controller. Both rectangles are offscreen.
    //设置newVC的frame
    CGRect rect = self.view.bounds;
    rect.origin.x += CGRectGetWidth(self.view.bounds);
    newVC.view.frame = rect;
    //获取oldVC的frame
    CGRect endFrame = oldVC.view.bounds;
    endFrame.origin.x -= CGRectGetWidth(self.view.bounds);
    //动画转场
    [self transitionFromViewController:oldVC toViewController:newVC duration:0.5 options:UIViewAnimationOptionTransitionNone animations:^{
        // Animate the views to their final positions.
        newVC.view.frame = oldVC.view.frame;
        oldVC.view.frame = endFrame;
    } completion:^(BOOL finished) {
        // Remove the old view controller and send the final
        // notification to the new view controller.
        [oldVC removeFromParentViewController];
        [newVC didMoveToParentViewController:self];
    }];
}

//Returning NO lets UIKit know that your container view controller notifies its children of changes in its appearance
//- (BOOL)shouldAutomaticallyForwardAppearanceMethods{
//    return YES;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
