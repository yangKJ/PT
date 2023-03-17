//
//  CCViewController.m
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

#import "CCViewController.h"

@interface CCViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation CCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - lazy

- (UILabel *)label {
    if (_label == nil) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        _label.center = self.view.center;
        _label.text = @"Condy";
        _label.textColor = UIColor.redColor;
        _label.font = [UIFont systemFontOfSize:40];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.backgroundColor = [UIColor.greenColor colorWithAlphaComponent:0.5];
    }
    return _label;
}

@end
