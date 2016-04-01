//
//  TargetObject.m
//  RunTimeTestDemo
//
//  Created by 王林 on 16/4/1.
//  Copyright © 2016年 sjaiwl. All rights reserved.
//

#import "TargetObject.h"

@implementation TargetObject

- (void)clickAction:(UIButton *)sender{
    NSLog(@"forward target");
    NSLog(@"%@", sender);
}

@end
