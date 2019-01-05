//
//  SJTabBarController.m
//  SJNotes
//
//  Created by jocentzhou on 2017/10/27.
//  Copyright © 2017年 jocentzhou. All rights reserved.
//

#import "SJTabBarController.h"
#import "SJSystemFramesViewController.h"
#import "SJThirdFramesViewController.h"
#import "SJModuleViewController.h"
#import "SJMyCenterViewController.h"
#import "UIColor+HexColor.h"

@interface SJTabBarController ()

@end

@implementation SJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorFromHexString:@"#04d940"]}
                                             forState:UIControlStateSelected];
    UIImage *bgImage = [UIImage imageNamed:@"nav_bg_ic"];
    bgImage = [bgImage resizableImageWithCapInsets:UIEdgeInsetsMake(20, 20, 0, 0) resizingMode:UIImageResizingModeStretch];
    [self.navigationController.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    UIImage *tbImage = [UIImage imageNamed:@"tabbar_bg_ic"];
    tbImage = [tbImage resizableImageWithCapInsets:UIEdgeInsetsMake(20, 20, 0, 0) resizingMode:UIImageResizingModeStretch];
    self.tabBar.backgroundImage = tbImage;
    
    NSArray *selectedImageNameArray = [NSArray arrayWithObjects:@"ic_home_sel",
                                       @"ic_information_sel",
                                       @"ic_note_sel",
                                       @"ic_user_sel", nil];
    NSArray *unselectImageNameArray = [NSArray arrayWithObjects:@"ic_home_nor",
                                       @"ic_information_nor",
                                       @"ic_note_nor",
                                       @"ic_user_nor", nil];
//    NSArray *storyboardNames = [NSArray arrayWithObjects:@"Home", @"Family", @"Find", @"Personal", nil];
    NSMutableArray *viewControllers = [NSMutableArray array];
    NSArray *viewControllersID = [NSArray arrayWithObjects:NSStringFromClass([SJSystemFramesViewController class]),
                                  NSStringFromClass([SJThirdFramesViewController class]),
                                  NSStringFromClass([SJModuleViewController class]),
                                  NSStringFromClass([SJMyCenterViewController class]), nil];
    for (int i = 0; i < [self.viewControllers count]; i++) {
        
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardNames[i] bundle:nil];
//        UINavigationController *navigationViewController;
//        navigationViewController = [storyboard instantiateViewControllerWithIdentifier:[NSString stringWithFormat:@"UINavigationController_%@", storyboardNames[i]]];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:viewControllersID[i]];
        UIImage * selectedImage = [[UIImage imageNamed:[selectedImageNameArray objectAtIndex:i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage * unselectImage = [[UIImage imageNamed:[unselectImageNameArray objectAtIndex:i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UITabBarItem *newItem = [[UITabBarItem alloc] initWithTitle:vc.title
                                                              image:unselectImage
                                                      selectedImage:selectedImage];
//        navigationViewController.tabBarItem = newItem;
//        [navigationViewController.navigationBar setTitleTextAttributes:
//
//         @{NSFontAttributeName:[UIFont boldSystemFontOfSize:18],
//           NSForegroundColorAttributeName:[UIColor whiteColor]}];
//
//        [viewControllers addObject:navigationViewController];
        
        vc.tabBarItem = newItem;
        [vc.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18],
                                                                        NSForegroundColorAttributeName:[UIColor whiteColor]}];
        [viewControllers addObject:vc];
    }
    self.viewControllers = [NSArray arrayWithArray:viewControllers];
    
    
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    self.title = viewController.title;
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
