//
//  DataHolder.h
//  OSXTest
//
//  Created by Appest on 15/10/27.
//  Copyright © 2015年 Appest Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataHolder : NSObject

@property (strong) NSMutableDictionary *dataDictionary;

+ (DataHolder *)getInstance;

@end
