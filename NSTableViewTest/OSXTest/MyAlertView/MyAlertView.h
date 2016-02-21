//
//  MyAlertView.h
//  OSXTest
//
//  Created by Appest on 15/10/26.
//  Copyright © 2015年 Appest Limited. All rights reserved.
//

#import <Cocoa/Cocoa.h>

//传值协议
@protocol MyAlertViewDelegate <NSObject>

-(void) myAlertViewClickConfirmButton:(NSString *) text;

@end


@interface MyAlertView : NSViewController

@property (weak) id<MyAlertViewDelegate> delegate;

@end
