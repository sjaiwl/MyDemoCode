//
//  DataHolder.m
//  OSXTest
//
//  Created by Appest on 15/10/27.
//  Copyright © 2015年 Appest Limited. All rights reserved.
//

#import "DataHolder.h"

static DataHolder *dataHolder = nil;

@implementation DataHolder

//单例
+ (DataHolder *)getInstance{
    if (dataHolder == nil) {
        dataHolder = [[DataHolder alloc] init];
    }
    return dataHolder;
}

//初始化
- (instancetype)init{
    if (self = [super init]) {
        _dataDictionary = [NSMutableDictionary new];
    }
    return self;
}

@end
