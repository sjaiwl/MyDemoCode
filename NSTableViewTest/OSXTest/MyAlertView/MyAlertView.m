//
//  MyAlertView.m
//  OSXTest
//
//  Created by Appest on 15/10/26.
//  Copyright © 2015年 Appest Limited. All rights reserved.
//

#import "MyAlertView.h"

@interface MyAlertView ()

@property (weak) IBOutlet NSTextField *content;

@end

@implementation MyAlertView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

#pragma mark - button点击事件
- (IBAction)confirmButton:(NSButton *)sender {
    //代理传值
    if (_delegate != nil && [_delegate respondsToSelector:@selector(myAlertViewClickConfirmButton:)] && ![[_content stringValue] isEqualToString:@""]) {
        [_delegate myAlertViewClickConfirmButton:[_content stringValue]];
        //弹出框消失
        [self dismissController:self];
    }
}

- (IBAction)cancelButton:(NSButton *)sender {
    //弹出框消失
    [self dismissController:self];
}

@end
