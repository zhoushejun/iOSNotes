//
//  SJQSortViewController.m
//  SJNotes
//
//  Created by 周社军 on 2017/11/13.
//  Copyright © 2017年 jocentzhou. All rights reserved.
//

#import "SJQSortViewController.h"

@interface SJQSortViewController ()

@end

@implementation SJQSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

void Qsort(int *a, int left, int right) {
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
