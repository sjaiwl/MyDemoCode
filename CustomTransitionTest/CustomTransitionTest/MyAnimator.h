//
//  MyAnimator.h
//  CustomTransitionTest
//
//  Created by Appest on 15/10/29.
//  Copyright © 2015年 Appest Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyAnimator : NSObject<UIViewControllerAnimatedTransitioning>

@property (assign, nonatomic, getter=isPresented) BOOL presented;

@end
