//
//  ViewController.m
//  RunLoopTestDemo
//
//  Created by 王林 on 16/3/31.
//  Copyright © 2016年 sjaiwl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondResultLabel;

@property (nonatomic, strong) NSTimer *currentTimer;
@property (nonatomic, strong) NSTimer *secondTimer;

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger secondCount;

@end


@implementation ViewController

#pragma mark - main thread timer
- (IBAction)startTimerAction:(UIButton *)sender {
    if (!self.currentTimer) {
        self.count = 0;
        self.currentTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(mainCalculateTimer:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.currentTimer forMode:NSRunLoopCommonModes];

    }
}
- (IBAction)stopTimerAction:(UIButton *)sender {
    if (self.currentTimer && self.currentTimer.isValid) {
        [self.currentTimer invalidate];
        self.currentTimer = nil;
        self.count = 0;
        self.resultLabel.text = @"0";
    }
}

- (void)mainCalculateTimer:(NSTimer *)timer{
    self.count = self.count + 1;
    self.resultLabel.text = [NSString stringWithFormat:@"%ld",self.count];
}

#pragma mark - second thread timer
- (IBAction)secondTreadAction:(UIButton *)sender {
    if (!self.secondTimer) {
        self.secondCount = 0;
        NSLog(@"%d",[NSRunLoop currentRunLoop] == [NSRunLoop mainRunLoop]);
        __weak ViewController *weakSelf = self;
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"%d",[NSRunLoop currentRunLoop] == [NSRunLoop mainRunLoop]);

            weakSelf.secondTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:weakSelf selector:@selector(secondThreadTimer:) userInfo:nil repeats:YES];

            [[NSRunLoop currentRunLoop] addTimer:weakSelf.secondTimer forMode:NSDefaultRunLoopMode];

            [[NSRunLoop currentRunLoop] run];
            
        });
    }
}

- (IBAction)secondThreadStopAction:(UIButton *)sender {
    if (self.secondTimer && self.secondTimer.isValid) {
        [self.secondTimer invalidate];
        self.secondTimer = nil;
        self.secondCount = 0;
        self.secondResultLabel.text = @"0";
    }
}


- (void)secondThreadTimer:(NSTimer *)timer{
    NSLog(@"second thread timer count");
    self.secondCount = self.secondCount + 1;
    __weak ViewController *weakSelf = self;
    dispatch_sync(dispatch_get_main_queue(), ^{
        weakSelf.secondResultLabel.text = [NSString stringWithFormat:@"%ld",self.secondCount];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.resultLabel.text = @"0";
    self.secondResultLabel.text = @"0";
    self.title = @"RunLoop中NSTimer使用";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
