//
//  SJQSortViewController.m
//  SJNotes
//
//  Created by 周社军 on 2017/11/13.
//  Copyright © 2017年 jocentzhou. All rights reserved.
//

#import "SJQSortViewController.h"

@interface SJQSortViewController ()
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UILabel *lblSort;
@property (nonatomic, strong) UIButton *btnSort;
@property (nonatomic, strong) UILabel *lblSorted;
@end

@implementation SJQSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.view.backgroundColor = [UIColor orangeColor];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).mas_offset(300);
        make.left.equalTo(self.view.mas_left).mas_offset(20);
        make.right.equalTo(self.view.mas_right).mas_offset(-20);
        make.height.equalTo(@40);
    }];
    
    [self.btnSort mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textField.mas_bottom).mas_offset(20);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(@100);
        make.height.equalTo(@44);
    }];
    
    [self.lblSorted mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btnSort.mas_bottom).mas_offset(20);
        make.left.equalTo(self.textField.mas_left);
        make.right.equalTo(self.btnSort.mas_right);
        make.height.equalTo(@60);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.keyboardType = UIKeyboardTypeNumberPad;
        _textField.backgroundColor = [UIColor grayColor];
        
        [self.view addSubview:_textField];
    }
    
    return _textField;
}

- (UILabel *)lblSort {
    if (!_lblSort) {
        _lblSort = [[UILabel alloc] init];
        _lblSort.textColor = [UIColor orangeColor];
        _lblSort.font = [UIFont systemFontOfSize:12];
        
        [self.view addSubview:_lblSort];
    }
    return _lblSort;
}

- (UIButton *)btnSort {
    if (!_btnSort) {
        _btnSort = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnSort setTitle:@"排序" forState:UIControlStateNormal];
        [_btnSort addTarget:self action:@selector(tappedButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _btnSort.backgroundColor = [UIColor grayColor];
        
        [self.view addSubview:_btnSort];
    }
    
    return _btnSort;
}

- (UILabel *)lblSorted {
    if (!_lblSorted) {
        _lblSorted = [[UILabel alloc] init];
        _lblSort.textColor = [UIColor orangeColor];
        _lblSort.font = [UIFont systemFontOfSize:12];
        _lblSorted.numberOfLines = 0;
        
        [self.view addSubview:_lblSorted];
    }
    
    return _lblSorted;
}


- (void)tappedButtonAction:(UIButton *)button {
    NSLogCurrentFunction
    NSString *str = self.textField.text;
    NSArray *arr = [str componentsSeparatedByString:@" "];
    int a[arr.count];
    for (int i = 0; i < arr.count; i++) {
        a[i] = [arr[i] intValue];
    }
    
    NSString *strLog = @"";
    Qsort(&a, 0, (int)arr.count);
    for (int i = 0; i < arr.count; i++) {
        strLog = [NSString stringWithFormat:@"%@ %d", strLog, a[i]];
    }
    NSLog(@"%@", strLog);
    self.lblSorted.text = strLog;
}

void Qsort(int *a, unsigned int left, unsigned int right) {
    if  (left >= right) {
        return;
    }
    int first = left;
    int last = right;
    int k = a[left];
    while (first < last) {
        while (first < last && a[last] >= k) {
            last--;
        }
        a[first] = a[last];
        while (first < last && k >= a[first]) {
            first++;
        }
        a[last] = a[first];
    }
    a[first] = k;
    
    Qsort(a, left, first-1);
    Qsort(a, first+1, right);
    
}

@end
