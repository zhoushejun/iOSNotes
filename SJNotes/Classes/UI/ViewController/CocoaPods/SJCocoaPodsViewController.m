//
//  SJCocoaPodsViewController.m
//  SJNotes
//
//  Created by 周社军 on 2019/1/12.
//  Copyright © 2019 jocentzhou. All rights reserved.
//

#import "SJCocoaPodsViewController.h"
#import <WebKit/WebKit.h>

@interface SJCocoaPodsViewController ()
@property (nonatomic, strong) WKWebView *webView;

@end

@implementation SJCocoaPodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    self.webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:config];
    NSURL *url = [NSURL URLWithString:@"https://github.com/zhoushejun/iOSNotes/blob/master/Contents"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
    
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.edges.equalTo(self.view);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
        make.right.equalTo(self.view.mas_right);
    }];
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
