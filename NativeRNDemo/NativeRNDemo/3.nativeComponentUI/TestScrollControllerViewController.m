//
//  TestScrollControllerViewController.m
//  NativeRNDemo
//
//  Created by 叮咚钱包富银 on 2018/3/6.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "TestScrollControllerViewController.h"
#import <React/RCTRootView.h>
#import <React/RCTBundleURLProvider.h>

@interface TestScrollControllerViewController ()

@end

@implementation TestScrollControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = YES;
    [[RCTBundleURLProvider sharedSettings] setJsLocation:@"192.168.0.101"];

    NSString * strUrl = @"http://192.168.0.101:8081/nativeUI.bundle?platform=ios&dev=true";
    NSURL * jsCodeLocation = [NSURL URLWithString:strUrl];
    
    RCTRootView * rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                         moduleName:@"NativeRNApp"
                                                  initialProperties:nil
                                                      launchOptions:nil];

    self.view = rootView;
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
