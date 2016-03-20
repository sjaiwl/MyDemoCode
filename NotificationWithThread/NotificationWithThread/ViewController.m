//
//  ViewController.m
//  NotificationWithThread
//
//  Created by 王林 on 16/3/20.
//  Copyright © 2016年 sjaiwl. All rights reserved.
//

#import "ViewController.h"
#import "NWTConstants.h"
#import "Poster.h"
#import "Observer.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *testButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    NSLog(@"current thread = %@", [NSThread currentThread]);

//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:TEST_NOTIFICATION object:nil];
//
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//
//        [[NSNotificationCenter defaultCenter] postNotificationName:TEST_NOTIFICATION object:nil userInfo:nil];
//    });
    Poster *poster = [[Poster alloc] init];

    __autoreleasing Observer *observer = [[Observer alloc] init];
}

//- (void)handleNotification:(NSNotification *)notification
//{
//    NSLog(@"current thread = %@", [NSThread currentThread]);
//
//    NSLog(@"test notification");
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
