//
//  MyTableRowView.m
//  OSXTest
//
//  Created by Appest on 15/10/28.
//  Copyright © 2015年 Appest Limited. All rights reserved.
//

#import "MyTableRowView.h"

@implementation MyTableRowView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    // Drawing code here.
}

//修改选中颜色
- (void)drawSelectionInRect:(NSRect)dirtyRect{
    if (self.selectionHighlightStyle !=    NSTableViewSelectionHighlightStyleNone) {
//        NSRect selectionRect = NSInsetRect(self.bounds, 0, 0);
        //获取选中rect
        NSRect selectionRect = NSRectFromCGRect(self.bounds);
//        [[NSColor colorWithCalibratedWhite:.65 alpha:1.0] setStroke];
        //
        [[NSColor colorWithRed:0.45 green:0.57 blue:0.76 alpha:1.00] setFill];
        NSBezierPath *selectionPath = [NSBezierPath bezierPathWithRect:selectionRect];
        [selectionPath fill];
//        [selectionPath stroke];
    }
}

@end
