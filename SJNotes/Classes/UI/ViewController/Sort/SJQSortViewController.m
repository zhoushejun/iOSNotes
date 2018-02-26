//
//  SJQSortViewController.m
//  SJNotes
//
//  Created by 周社军 on 2017/11/13.
//  Copyright © 2017年 jocentzhou. All rights reserved.
//

#import "SJQSortViewController.h"

@interface SJQSortViewController ()
@property (nonatomic, strong) UILabel *lblSort;
@property (nonatomic, strong) UIButton *btnSort;
@property (nonatomic, strong) UILabel *lblSorted;
@property (nonatomic, strong) NSMutableArray *datas;
@end

@implementation SJQSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.lblSort.text = @"49 38 65 97 76 13 27";

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.lblSort mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).mas_offset(40);
        make.left.equalTo(self.view.mas_left).mas_offset(20);
        make.right.equalTo(self.view.mas_right).mas_offset(-20);
        make.height.equalTo(@40);
    }];
    
    [self.btnSort mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lblSort.mas_bottom).mas_offset(20);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(@100);
        make.height.equalTo(@44);
    }];
    
    [self.lblSorted mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btnSort.mas_bottom).mas_offset(20);
        make.left.equalTo(self.lblSort.mas_left);
        make.right.equalTo(self.btnSort.mas_right);
        make.height.equalTo(@60);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
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
        [_btnSort setTitle:@"快速排序" forState:UIControlStateNormal];
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
    [self.view endEditing:YES];
    self.lblSorted.text = @"";
    
    sleep(1);
    int a[] = {49, 38, 65, 97, 76, 13, 27};
    NSString *strLog = @"";
    for (int i = 0; i < sizeof(a) / sizeof(a[0]); i++) {
        strLog = [NSString stringWithFormat:@"%@ %d", strLog, a[i]];
    }
    NSLog(@"%@", strLog);
    Qsort(a, 0,  sizeof(a) / sizeof(a[0]) - 1);
    strLog = @"";
    for (int i = 0; i < sizeof(a) / sizeof(a[0]); i++) {
        strLog = [NSString stringWithFormat:@"%@ %d", strLog, a[i]];
    }
    NSLog(@"%@", strLog);
}

void Qsort(int *a, int left, int right) {
    if(left >= right){/*如果左边索引大于或者等于右边的索引就代表已经整理完成一个组了*/
        return ;
    }
   
    int i = left;
    int j = right;
    int key = a[left];
    
    while(i < j) { /*控制在当组内寻找一遍*/
        while(i < j && key <= a[j]) {
        /*而寻找结束的条件就是，1，找到一个小于或者大于key的数（大于或小于取决于你想升
         序还是降序）2，没有符合条件1的，并且i与j的大小没有反转*/
            j--;/*向前寻找*/
        }
        
        a[i] = a[j];
        
        /*找到一个这样的数后就把它赋给前面的被拿走的i的值（如果第一次循环且key是
         a[left]，那么就是给key）*/
        
        while(i < j && key >= a[i]){ /*这是i在当组内向前寻找，同上，不过注意与key的大小关系停止循环和上面相反，
         因为排序思想是把数往两边扔，所以左右两边的数大小与key的关系相反*/
            i++;
        }
        
        a[j] = a[i];
        
    }
    
    a[i] = key;/*当在当组内找完一遍以后就把中间数key回归*/
    NSString *strLog = @"";
    for (int i = 0; i < 7; i++) {
        strLog = [NSString stringWithFormat:@"%@ %d", strLog, a[i]];
    }
    NSLog(@"%@", strLog);
    
    Qsort(a, left, i - 1);/*最后用同样的方式对分出来的左边的小组进行同上的做法*/
    strLog = @"";
    for (int i = 0; i < 7; i++) {
        strLog = [NSString stringWithFormat:@"%@ %d", strLog, a[i]];
    }
    NSLog(@"%@", strLog);
    Qsort(a, i + 1, right);/*用同样的方式对分出来的右边的小组进行同上的做法*/
    /*当然最后可能会出现很多分左右，直到每一组的i = j 为止*/
}


@end
