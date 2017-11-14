//
//  SJRootViewController.m
//  SJNotes
//
//  Created by shejun.zhou on 16/1/16.
//  Copyright © 2016年 shejun.zhou. All rights reserved.
//

#import "SJRootViewController.h"
#import "SJViewControllersHeader.h"
#import "SJItem.h"
#import "SJRootViewCell.h"
#import "UIColor+Random.h"

#define kColor @"kColor"
#define kTitle @"kTitle"
#define kValues @"kValues"

@interface SJRootViewController ()

@property (nonatomic, strong, nullable) NSMutableArray *items;

@end

@implementation SJRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.items count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dic = self.items[section];
    NSArray *array = [dic valueForKey:kValues];
    return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SJRootViewCell *cell = (SJRootViewCell *)[tableView dequeueReusableCellWithIdentifier:@"SJRootTableViewCellIdentifier" forIndexPath:indexPath];
    NSDictionary *dic = self.items[indexPath.section];
    NSArray *array = [dic valueForKey:kValues];
    
    [cell loadContentWithData:array[indexPath.row] indexPath:indexPath];
    
    return cell;
}

#pragma mark - UITableViewDelegate

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return <#expression#>
//}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSDictionary *dic = self.items[section];
    NSString *title = [dic valueForKey:kTitle];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [dic valueForKey:kColor];
    UILabel *lbl = [[UILabel alloc] init];
    lbl.frame = CGRectMake(10, 0, SCREEN_WIDTH-2*10, 28);
    lbl.text = title;
    [view addSubview:lbl];
    return view;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *dic = self.items[indexPath.section];
    NSArray *array = [dic valueForKey:kValues];
    
    SJItem *item = array[indexPath.row];
    UIViewController *viewController = [[item.object alloc] init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.title = item.name;
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - private

#pragma mark - getter and setter

- (NSMutableArray *)items {
    if (!_items) {
        NSArray *array = @[@{kColor:[UIColor randomColor],
                             kTitle:@"算法",
                             kValues:@[[SJItem itemWithName:@"快速排序" object:[SJQSortViewController class]],
                                       [SJItem itemWithName:@"SJNotes1.2" object:[UIViewController class]]]
                             },// section 1
                           @{kColor:[UIColor randomColor],
                             kTitle:@"SJNotes2",
                             kValues:@[[SJItem itemWithName:@"SJNotes2.1" object:[UIViewController class]],
                                       [SJItem itemWithName:@"SJNotes2.2" object:[UIViewController class]]]
                             } // section 2
                           ];
        _items = [NSMutableArray arrayWithArray:array];
    }
    return _items;
}

@end
