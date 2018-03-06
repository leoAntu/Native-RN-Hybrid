//
//  InitRootViewController.m
//  NativeRNDemo
//
//  Created by 叮咚钱包富银 on 2018/3/5.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "InitRootViewController.h"
#import <React/RCTRootView.h>
#import <React/RCTBundleURLProvider.h>
#import <CodePush.h>
@interface InitRootViewController ()

@end

@implementation InitRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL *jsCodeLocation;
    
#ifdef DEBUG
        [[RCTBundleURLProvider sharedSettings] setJsLocation:@"192.168.0.101"];
        NSString * strUrl = @"http://192.168.0.101:8081/index.bundle?platform=ios&dev=true";
        jsCodeLocation = [NSURL URLWithString:strUrl];
    //    0d7fcac0d1608f6efb924006b9926c72e08614ad
//    jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
#else
    jsCodeLocation = [CodePush bundleURLForResource:@"index"];
#endif
//    [[RCTBundleURLProvider sharedSettings] setJsLocation:@"192.168.0.101"];

//    NSString * strUrl = @"http://192.168.0.101:8081/index.bundle?platform=ios&dev=true";
//    NSURL * jsCodeLocation = [NSURL URLWithString:strUrl];
//    0d7fcac0d1608f6efb924006b9926c72e08614ad
    RCTRootView * rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                         moduleName:@"NativeRNApp"
                                                  initialProperties:@{
                                                                      @"name": @"李四"
                                                                      }
                                                      launchOptions:nil];
    
    rootView.frame = CGRectMake(100, 100, 200, 200);
    //    rootView.backgroundColor = [UIColor redColor];
    [self.view addSubview:rootView];
    
    //    NSString * strUrl1 = @"http://localhost:8081/index2.bundle?platform=ios&dev=true";
    //    NSURL * jsCodeLocation1 = [NSURL URLWithString:strUrl1];
    //
    //    RCTRootView * rootView1 = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation1
    //                                                         moduleName:@"NativeRNApp"
    //                                                  initialProperties:nil
    //                                                      launchOptions:nil];
    //
    //    rootView1.frame = CGRectMake(100, 350, 200, 200);
    //    //    rootView.backgroundColor = [UIColor redColor];
    //    [self.view addSubview:rootView1];
}

- (void)dealloc {
    NSLog(@"%s",__FUNCTION__);
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
