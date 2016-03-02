//
//  TopTitleScrollView.m
//  Xcode_Test
//
//  Created by sjaiwl on 15/9/23.
//  Copyright © 2015年 sjaiwl. All rights reserved.
//

#import "TopTitleScrollView.h"
//动画播放间隔
static const NSTimeInterval kAnimationDuration = 0.5;
//字体差距
static const NSInteger kTitleSizeSpace = 4;
//底部视图高度
static const NSInteger kBottomViewHeight = 2;

@interface TopTitleScrollView ()
//scroll总体宽度
@property (nonatomic,assign) CGFloat totalWidth;
@end

@implementation TopTitleScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //初始化数据
        _totalWidth = 0;
        _currentIndex = 0;
        _titleNorFontSize = 16;
        _titleNormalColor = [UIColor grayColor];
        _titleSelectedColor = [UIColor redColor];
        _btArray= [NSMutableArray new];
    }
    return self;
}

/**
 *  创建scrollView视图
 *
 *  @param titleArray 文字标题数组
 */
- (void)setTitleArray:(NSArray *)titleArray{
    //创建button
    UIButton *btn = nil;
    for (int i = 0; i < titleArray.count; i++) {
        //根据文字动态计算btn的宽度
        CGFloat btnWidth = [self calculateTitleWidth:titleArray[i] andFont:[UIFont systemFontOfSize:self.titleNorFontSize + kTitleSizeSpace]];
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        //设置frame
        btn.frame = CGRectMake(_totalWidth, 0, btnWidth, self.frame.size.height);
        //增加total
        self.totalWidth += btnWidth;
        //设置标题文字
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        //设置文字大小
        btn.titleLabel.font = [UIFont systemFontOfSize:_titleNorFontSize];
        //设置正常文字颜色
        [btn setTitleColor:_titleNormalColor forState:UIControlStateNormal];
        //设置选中文字颜色
        [btn setTitleColor:_titleSelectedColor forState:UIControlStateSelected];
        //添加选中事件
        [btn addTarget:self action:@selector(clickTitleButton:) forControlEvents:UIControlEventTouchUpInside];
        //添加视图
        [self addSubview:btn];
        //添加到数组
        [_btArray addObject:btn];
    }
    //设置scroll
    self.contentSize = CGSizeMake(_totalWidth, self.frame.size.height);
    //设置bottom
    [self setBottomViewFrame];
}

/**
 *  设置底部横线frame
 */
- (void)setBottomViewFrame{
    //设置底部横线
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - kBottomViewHeight, 0, 0)];
    self.bottomView.backgroundColor = _titleSelectedColor;
    //添加视图
    [self addSubview:_bottomView];
}

/**
 *  设置当前选中按钮
 *
 *  @param currentIndex 选中下标
 */
- (void)setCurrentIndex:(NSInteger)currentIndex {
    if (_currentBtn != nil) {
        _currentBtn.selected = NO;
    }
    self.currentBtn = _btArray[currentIndex];
    _currentBtn.selected = YES;
    //设置下划线
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.bottomView.frame = CGRectMake(_currentBtn.frame.origin.x, self.frame.size.height - kBottomViewHeight, _currentBtn.frame.size.width, kBottomViewHeight);
    }];
    //标题内容可见
    [self scrollRectToVisible:_currentBtn.frame animated:YES];
    //设置内容scroll滚动到指定视图
    if (_contentScroll != nil) {
        [UIView animateWithDuration:kAnimationDuration animations:^{
            _contentScroll.contentOffset = CGPointMake(self.contentScroll.frame.size.width * currentIndex, 0);
        }];

    }
}

//btn点击事件
- (void)clickTitleButton:(UIButton *)sender{
    if ([sender isEqual:_currentBtn]) {
        return;
    }
    //设置选中下标
    self.currentIndex = [_btArray indexOfObject:sender];
}

//计算文字宽度
- (CGFloat)calculateTitleWidth:(NSString *)text andFont:(UIFont*) textFont{
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName:textFont}];
    return size.width;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
