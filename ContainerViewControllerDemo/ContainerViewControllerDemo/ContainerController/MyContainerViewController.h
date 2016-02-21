//
//  MyContainerViewController.h
//  ContainerViewControllerDemo
//
//  Created by Appest on 15/10/28.
//  Copyright © 2015年 Appest Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyContainerViewController : UIViewController

//展现controller
- (void) displayContentController: (UIViewController*) content;
//隐藏controller
- (void) hideContentController: (UIViewController*) content;
//页面切换
- (void)cycleFromViewController: (UIViewController*) oldVC
               toViewController: (UIViewController*) newVC;
@end
