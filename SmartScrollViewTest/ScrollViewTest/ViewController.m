//
//  ViewController.m
//  ScrollViewTest
//
//  Created by sjaiwl on 15/10/10.
//  Copyright © 2015年 sjaiwl. All rights reserved.
//

#import "ViewController.h"
#import "TopTitleScrollView.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic,retain) NSArray *titleArray;
@property (nonatomic,retain) TopTitleScrollView *titleScroll;
@property (nonatomic,retain) UIScrollView *scrollView;

@end

@implementation ViewController

- (NSArray *)titleArray{
    if (!_titleArray) {
        _titleArray = @[@"首页",@"订阅",@"娱乐",@"科技",@"财经",@"军事",@"社会",@"体育",@"汽车",@"微头条",@"时尚",@"股票",@"互动直播",@"教育",@"历史"];
    }
    return _titleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //设置scrollView
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * self.titleArray.count, 0);
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;

    for (int i = 0; i < self.titleArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * i + 50, 100, 300, 450)];
        imageView.image = [UIImage imageNamed:@"iPhone"];
        [self.scrollView addSubview:imageView];
    }
    [self.view addSubview:self.scrollView];
    //设置title
    self.titleScroll = [[TopTitleScrollView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 44)];
    self.titleScroll.titleArray = self.titleArray;
    self.titleScroll.contentScroll = self.scrollView;
    self.titleScroll.currentIndex = 0;
    self.titleScroll.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.titleScroll];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.titleScroll.currentIndex = scrollView.contentOffset.x / self.view.frame.size.width;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
