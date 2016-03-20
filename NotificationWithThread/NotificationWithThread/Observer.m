//
//  Observer.m
//  NotificationWithThread
//
//  Created by 王林 on 16/3/20.
//  Copyright © 2016年 sjaiwl. All rights reserved.
//

#import "Observer.h"
#import "NWTConstants.h"

@implementation Observer

- (instancetype)init
{
    self = [super init];

    if (self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:TEST_NOTIFICATION object:nil];
    }

    return self;
}

- (void)handleNotification:(NSNotification *)notification
{
    NSLog(@"handle notification begin");
    sleep(3);
    NSLog(@"handle notification end");

    self.i = 10;

    NSLog(@"%ld",self.i);
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

    NSLog(@"Observer dealloc");
}

@end
