//
//  TopTitleScrollView.h
//  Xcode_Test
//
//  Created by sjaiwl on 15/9/23.
//  Copyright © 2015年 sjaiwl. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface TopTitleScrollView : UIScrollView
//文字标题数组
@property (nonatomic,retain) NSArray *titleArray;
//底部下划线view
@property (nonatomic,retain) UIView *bottomView;
//button数组
@property (nonatomic,retain) NSMutableArray *btArray;
//当前选中的btn
@property (nonatomic,retain) UIButton *currentBtn;
//当前选中btn下标
@property (nonatomic,assign) NSInteger currentIndex;
//标题显示字体大小
@property (nonatomic,assign) CGFloat titleNorFontSize;
//标题文字默认颜色
@property (nonatomic,retain) UIColor *titleNormalColor;
//标题选中颜色,以及下划线的颜色
@property (nonatomic,retain) UIColor *titleSelectedColor;
//设置titleView的内容视图
@property (nonatomic,retain) UIScrollView *contentScroll;

@end
