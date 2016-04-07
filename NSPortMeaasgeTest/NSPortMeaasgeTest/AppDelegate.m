//
//  AppDelegate.m
//  NSPortMeaasgeTest
//
//  Created by 王林 on 16/4/7.
//  Copyright © 2016年 sjaiwl. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<NSPortDelegate>

@property (weak) IBOutlet NSWindow *window;
@property (nonatomic, strong) NSPort *port;

@end

@implementation AppDelegate

- (NSPort *)port{
    if (!_port) {
        _port = [NSMachPort port];
    }
    return _port;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [self addPort];
    [self launchSecondThread];

}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

#pragma mark - add port
- (void)addPort
{
    if (self.port)
    {
        // This class handles incoming port messages.
        [self.port setDelegate:self];

        // Install the port as an input source on the current run loop.
        [[NSRunLoop currentRunLoop] addPort:self.port forMode:NSRunLoopCommonModes];
    }
}

- (void)handlePortMessage:(NSPortMessage *)message{
    NSLog(@"%d",message.msgid);
}

#pragma mark - launchSecondThread
- (void)launchSecondThread{
    __weak AppDelegate *weakSelf = self;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // Create the check-in message.
        NSPortMessage* messageObj = [[NSPortMessage alloc] initWithSendPort:weakSelf.port receivePort:weakSelf.port components:nil];

        if (messageObj)
        {
            // Finish configuring the message and send it immediately.
            [messageObj setMsgid:8];
            [messageObj sendBeforeDate:[NSDate date]];
        }
    });

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // Create the check-in message.
        NSPortMessage* messageObj = [[NSPortMessage alloc] initWithSendPort:weakSelf.port receivePort:weakSelf.port components:nil];

        if (messageObj)
        {
            // Finish configuring the message and send it immediately.
            [messageObj setMsgid:10];
            [messageObj sendBeforeDate:[NSDate date]];
        }
    });
}

@end
