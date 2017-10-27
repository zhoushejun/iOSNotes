//
//  SJTabBarController.m
//  SJNotes
//
//  Created by jocentzhou on 2017/10/27.
//  Copyright © 2017年 jocentzhou. All rights reserved.
//

#import "SJTabBarController.h"

@interface SJTabBarController ()

@end

@implementation SJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *bgImage = [UIImage imageNamed:@"nav_bg_ic"];
    bgImage = [bgImage resizableImageWithCapInsets:UIEdgeInsetsMake(20, 20, 0, 0) resizingMode:UIImageResizingModeStretch];
    [self.navigationController.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
