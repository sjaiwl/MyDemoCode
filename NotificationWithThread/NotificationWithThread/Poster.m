//
//  Poster.m
//  NotificationWithThread
//
//  Created by 王林 on 16/3/20.
//  Copyright © 2016年 sjaiwl. All rights reserved.
//

#import "Poster.h"
#import "NWTConstants.h"

@implementation Poster

- (instancetype)init
{
    self = [super init];

    if (self)
    {
        [self performSelectorInBackground:@selector(postNotification) withObject:nil];
    }

    return self;
}

- (void)postNotification
{
    NSLog(@"post notification");

    [[NSNotificationCenter defaultCenter] postNotificationName:TEST_NOTIFICATION object:nil];
}

@end
