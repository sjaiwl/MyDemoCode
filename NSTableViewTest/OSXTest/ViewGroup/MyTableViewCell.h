//
//  MyTableViewCell.h
//  OSXTest
//
//  Created by Appest on 15/10/27.
//  Copyright © 2015年 Appest Limited. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MyTableViewCell : NSTableCellView

@property (weak) IBOutlet NSTextField *nameInput;
@property (weak) IBOutlet NSButton *addButton;

@end
