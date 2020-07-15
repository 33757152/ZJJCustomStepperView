//
//  ViewController.m
//  ZJJCustomStepperView
//
//  Created by admin on 2020/7/15.
//  Copyright © 2020 xtayqria. All rights reserved.
//

#import "ViewController.h"
#import "XtayStepperView.h"

@interface ViewController () {
    XtayStepperView *_stepperView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self method1];
    [self method2];
}

- (void)method1 {
    XtayStepperView *stepperView = [[XtayStepperView alloc] initWithFrame:CGRectMake(50, 100, 100, 30) withBGColor:[UIColor blueColor]];
    stepperView.valueBgLayerColor = [UIColor lightGrayColor];
    stepperView.stepValue = 1;
    stepperView.minValue = 10;
    stepperView.maxValue = 20;
    stepperView.currentValue = 12;
    [self.view addSubview:stepperView];
    _stepperView = stepperView;
}

- (void)method2 {
    XtayStepperView *stepperView = [[XtayStepperView alloc] initWithFrame:CGRectMake(50, 100, 100, 30) withDecreaseImageName:@"减号" increaseImageName:@"加号"];
    stepperView.valueBgLayerColor = [UIColor lightGrayColor];
    stepperView.stepValue = 1;
    stepperView.minValue = 10;
    stepperView.maxValue = 20;
    stepperView.currentValue = 8;
    [self.view addSubview:stepperView];
    _stepperView = stepperView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    NSLog(@"%d",_stepperView.currentValue);
}

@end
