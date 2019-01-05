//
//  SJMemoryNotesViewController.m
//  SJNotes
//
//  Created by 周社军 on 2017/12/17.
//  Copyright © 2017年 jocentzhou. All rights reserved.
//

#import "SJMemoryNotesViewController.h"
#import "SJMemoryNotesModel.h"
#include <malloc/malloc.h>

@interface SJMemoryNotesViewController ()
@property (nonatomic, strong) UIButton *btnReference;///< 参考资料连接
@property (nonatomic, strong) UILabel *lblReference;///< 参考资料连接

@property (nonatomic, strong) UIButton *btnCleanMemory;///< 可以被操作系统回收的内存
@property (nonatomic, strong) UIButton *btnDirtyMemory;///< 不可被操作系统回收的内存，即：所有非Clean Memory

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation SJMemoryNotesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.btnCleanMemory mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).mas_offset(20);
        make.left.equalTo(self.view.mas_left).mas_offset(20);
        make.height.equalTo(@44);
        make.width.equalTo(self.btnDirtyMemory);
    }];
    
    [self.btnDirtyMemory mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btnCleanMemory.mas_top);
        make.left.equalTo(self.btnCleanMemory.mas_right).mas_offset(20);
        make.right.equalTo(self.view.mas_right).mas_offset(-20);
        make.height.equalTo(self.btnCleanMemory);
        make.height.equalTo(self.btnCleanMemory);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLogCurrentFunction
}

#pragma mark -

- (void)tappedCleanMemoryButtonAction:(UIButton *)button {
    NSLogCurrentFunction
    NSString *str1 = @"Welcome!";// 1.Clean Memory，因为用这样的方法创建的是一个常量字符串，常量字符串是放在只读数据段的，如果这块内存被释放了，而我们又访问它的时候，操作系统可以在只读数据段中把值再读取出来重建这块内存。(ps:所以用这种方法创建的string是没有引用计数的。)
    NSString *str2 = [NSString stringWithFormat:@"%@", str1]; // 2.因为stringWithString:是在堆上分配内存的，如果我们不回收它的话，系统会一直占用这块内存。
//如何查看是常量字符串还是堆上分配的内存？
//方法一：通过llvm打印输出：p str1   p str2  看类型
//方法二：输出对象地址
//    NSLog(@"%p", str1);
//    NSLog(@"%p", str2);
    NSLog(@"%@", str2);
    
    char *buf = malloc(100 * 1024 * 1024); // 3.分配100M内存给buf
    for (int i = 0; i < 3*1024*1024; ++i) {
        buf[i] = rand();
    } // 4.buf的前3M内存被赋值
    //    free(buf);
    
    for (int i = 0; i < 1; ++i) {
        SJMemoryNotesModel *model = [SJMemoryNotesModel alloc];
        [self.array addObject:model];
        NSLog(@"Size of %@: %ld", NSStringFromClass([SJMemoryNotesModel class]), malloc_size((__bridge const void *) model));
    }
//    free(buf);
}

- (void)tappedDirtyMemoryButtonAction:(UIButton *)button {
    NSLogCurrentFunction
}

#pragma mark - getter / setter

- (UIButton *)btnCleanMemory {
    if (!_btnCleanMemory) {
        _btnCleanMemory = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnCleanMemory.backgroundColor = [UIColor orangeColor];
        [_btnCleanMemory setTitle:@"Test CleanMemory" forState:UIControlStateNormal];
        [_btnCleanMemory addTarget:self action:@selector(tappedCleanMemoryButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_btnCleanMemory];
    }
    
    return _btnCleanMemory;
}

- (UIButton *)btnDirtyMemory {
    if (!_btnDirtyMemory) {
        _btnDirtyMemory = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnDirtyMemory.backgroundColor = [UIColor orangeColor];
        [_btnDirtyMemory setTitle:@"Test DirtyMemory" forState:UIControlStateNormal];
        [_btnDirtyMemory addTarget:self action:@selector(tappedDirtyMemoryButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_btnDirtyMemory];
    }
    
    return _btnDirtyMemory;
}

- (NSMutableArray *)array {
    if (!_array) {
        _array = [[NSMutableArray alloc] init];
    }
    return _array;
}

@end
