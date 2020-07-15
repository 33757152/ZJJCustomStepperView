//
//  XtayStepperView.h
//  Test
//
//  Created by admin on 2020/7/14.
//  Copyright © 2020 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XtayStepperView : UIView

/// 减少增加是文字的初始化方法
- (instancetype)initWithFrame:(CGRect)frame withBGColor:(UIColor *)bgColor;

/// 减少增加是图片的初始化方法
- (instancetype)initWithFrame:(CGRect)frame withDecreaseImageName:(NSString *)decreaseImageName increaseImageName:(NSString *)increaseImageName;

/// 显示数值的控件背景颜色
@property (nonatomic, strong) UIColor *valueBgLayerColor;
/// 每一次增量
@property (nonatomic, assign) int stepValue;
/// 最小值
@property (nonatomic, assign) int minValue;
/// 最大值
@property (nonatomic, assign) int maxValue;
/// 当前的值
@property (nonatomic, assign) int currentValue;

@end

NS_ASSUME_NONNULL_END
