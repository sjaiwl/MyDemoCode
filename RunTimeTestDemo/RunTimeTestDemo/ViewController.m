//
//  ViewController.m
//  RunTimeTestDemo
//
//  Created by 王林 on 16/4/1.
//  Copyright © 2016年 sjaiwl. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "TargetObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100, 100, 100, 30);
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//void addMethod(id obj, SEL _cmd)
//{
//    NSLog(@"Doing add method");
//    NSLog(@"%@", obj);
//    NSLog(@"%@", NSStringFromSelector(_cmd));
//}
//
//+ (BOOL)resolveInstanceMethod:(SEL)sel{
//    if (sel == @selector(clickAction:)) {
//        class_addMethod([self class],sel,(IMP)addMethod,"v@:");
//        return YES;
//    }
//    return [super resolveInstanceMethod:sel];
//}

//- (id)forwardingTargetForSelector:(SEL)aSelector{
//    TargetObject *object = [TargetObject new];
//    if (aSelector == @selector(clickAction:) && [object respondsToSelector:aSelector]) {
//        return object;
//    }
//
//    return [super forwardingTargetForSelector:aSelector];
//}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    TargetObject *object = [TargetObject new];
    return [object methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    TargetObject *object = [TargetObject new];
    SEL invSEL = anInvocation.selector;
    if([object respondsToSelector:invSEL]) {
        [anInvocation invokeWithTarget:object];
    } else {
        [super forwardInvocation:anInvocation];
    }
}


@end
