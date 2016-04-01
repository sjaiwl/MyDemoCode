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

@property (nonatomic, strong) NSTimer *currentTimer;

@property (nonatomic, assign) NSInteger count;

@end


@implementation ViewController

- (IBAction)startTimerAction:(UIButton *)sender {
    if (!self.currentTimer) {
        self.count = 0;
        self.currentTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(calculateTimer:) userInfo:nil repeats:YES];
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

- (void)calculateTimer:(NSTimer *)timer{
    self.count = self.count + 1;
    self.resultLabel.text = [NSString stringWithFormat:@"%ld",self.count];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.resultLabel.text = @"0";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
