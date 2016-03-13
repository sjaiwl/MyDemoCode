//
//  AppDelegate.m
//  NSUserDefaultesObserverDemo
//
//  Created by 王林 on 16/3/13.
//  Copyright © 2016年 sjaiwl. All rights reserved.
//

#import "AppDelegate.h"

#define APP_GROUP_NAME @"com.defaultes.demo"

#define GROUP_VALUE_KEY_STRING @"kGroupValueKeyString"
#define SHARED_VALUE_KEY_STRING @"kSharedValueKeyString"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@property (nonatomic, strong) NSUserDefaults *groupDefaultes;
@property (nonatomic, strong) NSUserDefaultsController *groupDefaultesController;

@property (nonatomic, strong) NSUserDefaults *sharedDefaultes;
@property (nonatomic, strong) NSUserDefaultsController *sharedDefaultesController;

//group
@property (weak) IBOutlet NSButton *groupButton;
@property (weak) IBOutlet NSTextField *groupOldValueLabel;
@property (weak) IBOutlet NSTextField *groupNewValueField;

//shared
@property (weak) IBOutlet NSButton *sharedButton;
@property (weak) IBOutlet NSTextField *sharedOldValueLabel;
@property (weak) IBOutlet NSTextField *sharedNewValueField;


@end

@implementation AppDelegate

#pragma mark - Accessor
- (NSUserDefaults *)groupDefaultes{
    if (!_groupDefaultes) {
        _groupDefaultes = [[NSUserDefaults alloc] initWithSuiteName:APP_GROUP_NAME];
#warning 注释代码实现方式不正确
//        _groupDefaultes = [NSUserDefaults standardUserDefaults];
//        [_groupDefaultes addSuiteNamed:APP_GROUP_NAME];
    }
    return _groupDefaultes;
}

- (NSUserDefaultsController *)groupDefaultesController{
    if (!_groupDefaultesController) {
        _groupDefaultesController = [[NSUserDefaultsController alloc] initWithDefaults:self.groupDefaultes initialValues:nil];
    }
    return _groupDefaultesController;
}

- (NSUserDefaults *)sharedDefaultes{
    if (!_sharedDefaultes) {
        _sharedDefaultes = [NSUserDefaults standardUserDefaults];
    }
    return _sharedDefaultes;
}

- (NSUserDefaultsController *)sharedDefaultesController{
    if (!_sharedDefaultesController) {
        _sharedDefaultesController = [NSUserDefaultsController sharedUserDefaultsController];
    }
    return _sharedDefaultesController;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application

    //notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(defaultsDidChangeNotification:) name:NSUserDefaultsDidChangeNotification object:nil];

    //group defaultes
    if (![self.groupDefaultes objectForKey:GROUP_VALUE_KEY_STRING]) {
        [self.groupDefaultes setObject:@"123" forKey:GROUP_VALUE_KEY_STRING];
    }
    //shared defaultes
    if (![self.sharedDefaultes objectForKey:SHARED_VALUE_KEY_STRING]){
        [self.sharedDefaultes setObject:@"123" forKey:SHARED_VALUE_KEY_STRING];
    }

//    [self.groupOldValueLabel bind:NSValueBinding toObject:self.groupDefaultes withKeyPath:VALUE_KEY_STRING options:nil];
//
//    [self.sharedOldValueLabel bind:NSValueBinding toObject:self.sharedDefaultes withKeyPath:VALUE_KEY_STRING options:nil];

    [self.groupOldValueLabel bind:NSValueBinding toObject:self.groupDefaultesController withKeyPath:[@"values." stringByAppendingString:GROUP_VALUE_KEY_STRING] options:nil];

    [self.sharedOldValueLabel bind:NSValueBinding toObject:self.sharedDefaultesController withKeyPath:[@"values." stringByAppendingString:SHARED_VALUE_KEY_STRING] options:nil];

//    [self.groupDefaultes addObserver:self forKeyPath:GROUP_VALUE_KEY_STRING options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
//
//    [self.sharedDefaultes addObserver:self forKeyPath:SHARED_VALUE_KEY_STRING options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];


    //add observer
    [self.groupDefaultesController addObserver:self
                          forKeyPath:[@"values." stringByAppendingString:GROUP_VALUE_KEY_STRING]
                             options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                             context:nil];

    [self.sharedDefaultesController addObserver:self
                          forKeyPath:[@"values." stringByAppendingString:SHARED_VALUE_KEY_STRING]
                             options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                             context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if (object == self.groupDefaultesController && [keyPath isEqualToString:[@"values." stringByAppendingString:GROUP_VALUE_KEY_STRING]]) {
        NSLog(@"group defaultes changed");
        return;
    }

    if (object == self.sharedDefaultesController && [keyPath isEqualToString:[@"values." stringByAppendingString:SHARED_VALUE_KEY_STRING]]) {
        NSLog(@"shared defaultes changed");
        return;
    }

//    if (object == self.groupDefaultes && [keyPath isEqualToString:GROUP_VALUE_KEY_STRING]) {
//        NSLog(@"group defaultes changed");
//        return;
//    }
//
//    if (object == self.sharedDefaultes && [keyPath isEqualToString:SHARED_VALUE_KEY_STRING]) {
//        NSLog(@"shared defaultes changed");
//        return;
//    }
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

//notification
- (void)defaultsDidChangeNotification:(NSNotification *)notification{
    NSLog(@"%s,%@",__FUNCTION__,notification);
}

//button action
- (IBAction)changeGroupDefaultesAction:(NSButton *)sender {
    if (![self.groupNewValueField.stringValue isEqualToString:[self.groupDefaultes objectForKey:GROUP_VALUE_KEY_STRING]] && self.groupNewValueField.stringValue != nil && ![self.groupNewValueField.stringValue isEqualToString:@""]) {
        NSLog(@"change group defaultes");
        [self.groupDefaultes setObject:self.groupNewValueField.stringValue forKey:GROUP_VALUE_KEY_STRING];
    }
}

- (IBAction)changeSharedDefaultesAction:(NSButton *)sender {
    if (![self.sharedNewValueField.stringValue isEqualToString:[self.sharedDefaultes objectForKey:SHARED_VALUE_KEY_STRING]] && self.sharedNewValueField.stringValue != nil && ![self.sharedNewValueField.stringValue isEqualToString:@""]) {
        NSLog(@"change shared defaultes");
        [self.sharedDefaultes setObject:self.sharedNewValueField.stringValue forKey:SHARED_VALUE_KEY_STRING];
    }
}
@end
