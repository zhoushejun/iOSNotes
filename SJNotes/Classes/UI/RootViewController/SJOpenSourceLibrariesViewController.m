//
//  SJOpenSourceLibrariesViewController.m
//  SJNotes
//
//  Created by 周社军 on 2019/1/5.
//  Copyright © 2019 jocentzhou. All rights reserved.
//

#import "SJOpenSourceLibrariesViewController.h"
#import "SJViewControllersHeader.h"
#import "SJItem.h"
#import "SJRootViewCell.h"
#import "UIColor+Random.h"

@interface SJOpenSourceLibrariesViewController ()
@property (nonatomic, strong, nullable) NSMutableArray *items;

@end

@implementation SJOpenSourceLibrariesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
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
        NSArray *array = @[
                           @{kColor:[UIColor randomColor],
                             kTitle:@"工具类",
                             kValues:@[[SJItem itemWithName:@"CocoaPods" object:[SJCocoaPodsViewController class]]]
                             }
//                           ,// section 1
//                           @{kColor:[UIColor randomColor],
//                             kTitle:@"iOS内存管理",
//                             kValues:@[[SJItem itemWithName:@"iOS内存相关概念" object:[SJMemoryNotesViewController class]],
//                                       [SJItem itemWithName:@"SJNotes2.2" object:[UIViewController class]]]
//                             } // section 2
                           ];
        _items = [NSMutableArray arrayWithArray:array];
    }
    return _items;
}

@end

