//
//  XtayStepperView.m
//  Test
//
//  Created by admin on 2020/7/14.
//  Copyright © 2020 admin. All rights reserved.
//

#import "XtayStepperView.h"

@interface XtayStepperView () <UITextFieldDelegate>

/// 视图总宽度
@property (nonatomic, assign) CGFloat viewWidth;
/// 视图总高度
@property (nonatomic, assign) CGFloat viewHeight;
/// 输入框
@property (nonatomic, strong) UITextField *valueTextField;

@end

@implementation XtayStepperView

- (instancetype)initWithFrame:(CGRect)frame withDecreaseImageName:(NSString *)decreaseImageName increaseImageName:(NSString *)increaseImageName {
    self = [super initWithFrame:frame];
    if (self) {
        self.viewWidth = frame.size.width;
        self.viewHeight = frame.size.height;
        [self creatImageViewWithDecreaseImageName:decreaseImageName increaseImageName:increaseImageName];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame withBGColor:(UIColor *)bgColor {
    self = [super initWithFrame:frame];
    if (self) {
        self.viewWidth = frame.size.width;
        self.viewHeight = frame.size.height;
        [self creatSystemViewWithBGColor:bgColor];
    }
    return self;
}

- (void)creatImageViewWithDecreaseImageName:(NSString *)decreaseImageName increaseImageName:(NSString *)increaseImageName {
    // left
    UIImageView *leftImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _viewHeight, _viewHeight)];
    leftImgView.image = [UIImage imageNamed:decreaseImageName];
    leftImgView.contentMode = UIViewContentModeScaleAspectFit;
    leftImgView.userInteractionEnabled = YES;
    [self addSubview:leftImgView];
    UITapGestureRecognizer *leftTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftTap:)];
    [leftImgView addGestureRecognizer:leftTap];
    
    [self addSubview:self.valueTextField];
    _valueTextField.frame = CGRectMake(_viewHeight, 0, _viewWidth-2*_viewHeight, _viewHeight);
    
    // right
    UIImageView *rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_viewWidth-_viewHeight, 0, _viewHeight, _viewHeight)];
    rightImageView.image = [UIImage imageNamed:increaseImageName];
    rightImageView.contentMode = UIViewContentModeScaleAspectFit;
    rightImageView.userInteractionEnabled = YES;
    [self addSubview:rightImageView];
    UITapGestureRecognizer *rightTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightTap:)];
    [rightImageView addGestureRecognizer:rightTap];
}

- (void)creatSystemViewWithBGColor:(UIColor *)bgColor {
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.backgroundColor = bgColor;
    leftBtn.frame = CGRectMake(0, 0, _viewHeight, _viewHeight);
    [leftBtn setTitle:@"－" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [leftBtn addTarget:self action:@selector(decreaseClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:leftBtn];
    
    [self addSubview:self.valueTextField];
    _valueTextField.frame = CGRectMake(_viewHeight, 0, _viewWidth-2*_viewHeight, _viewHeight);
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.backgroundColor = bgColor;
    rightBtn.frame = CGRectMake(_viewWidth-_viewHeight, 0, _viewHeight, _viewHeight);
    [rightBtn setTitle:@"+" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [rightBtn addTarget:self action:@selector(increaseClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:rightBtn];
}

- (UITextField *)valueTextField {
    if (!_valueTextField) {
        _valueTextField = [[UITextField alloc] init];
        _valueTextField.font = [UIFont systemFontOfSize:15];
        _valueTextField.textAlignment = NSTextAlignmentCenter;
        _valueTextField.textColor = [UIColor blackColor];
        _valueTextField.delegate = self;
    }
    return _valueTextField;
}

- (void)setValueBgLayerColor:(UIColor *)valueBgLayerColor {
    _valueBgLayerColor = valueBgLayerColor;
    self.valueTextField.layer.borderColor = _valueBgLayerColor.CGColor;
    self.valueTextField.layer.borderWidth = 1;
}

- (void)setStepValue:(int)stepValue {
    _stepValue = stepValue;
}

- (void)setMinValue:(int)minValue {
    _minValue = minValue;
}

- (void)setMaxValue:(int)maxValue {
    _maxValue = maxValue;
}

- (void)setCurrentValue:(int)currentValue {
    _currentValue = currentValue;
    [self giveTFValue];
}

- (void)leftTap:(UITapGestureRecognizer *)tap {
    [self decreaseClick];
}

- (void)rightTap:(UITapGestureRecognizer *)tap {
    [self increaseClick];
}

- (void)decreaseClick {
    if (self.currentValue <= _minValue) {
        return;
    }
    self.currentValue --;
    [self giveTFValue];
}

- (void)increaseClick {
    if (self.currentValue >= _maxValue) {
        return;
    }
    self.currentValue ++;
    [self giveTFValue];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    int value = [textField.text intValue];
    if (value >= _minValue && value <= _maxValue) {
        self.currentValue = value;
    }
    [self giveTFValue];
}

- (void)giveTFValue {
    self.valueTextField.text = [NSString stringWithFormat:@"%d",_currentValue];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
