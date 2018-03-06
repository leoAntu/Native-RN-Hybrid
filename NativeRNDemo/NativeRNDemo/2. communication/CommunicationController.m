//
//  CommunicationController.m
//  NativeRNDemo
//
//  Created by 叮咚钱包富银 on 2018/3/5.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "CommunicationController.h"
#import <React/RCTRootView.h>
#import <React/RCTBundleURLProvider.h>
@interface CommunicationController ()
@property (weak, nonatomic) IBOutlet UIView *rnView;
@property (weak, nonatomic) IBOutlet UILabel *infoLab;

@end

@implementation CommunicationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self initView];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(dealWithRN:)
                                                 name:@"react_native_test"
                                               object:nil];
}

- (void)dealWithRN:(NSNotification *)notification
{
    NSDictionary *theData = [notification userInfo];
    
    NSString *info = theData[@"info"];
    
    _infoLab.text = info;
}

- (void)initView {
    [[RCTBundleURLProvider sharedSettings] setJsLocation:@"192.168.0.101"];

    NSString * strUrl = @"http://192.168.0.101:8081/nativeToRN.bundle?platform=ios&dev=true";
//    native to rn 通过通知监听事件交互
    if (self.colloerType == NativeToRNbyNotification) {
        strUrl = @"http://192.168.0.101:8081/nativeToRN.bundle?platform=ios&dev=true";
    } else if (self.colloerType == RNToNative) {  // rn to native
        strUrl = @"http://192.168.0.101:8081/rnTonative.bundle?platform=ios&dev=true";
    }
    NSURL * jsCodeLocation = [NSURL URLWithString:strUrl];
    
    RCTRootView * rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                         moduleName:@"NativeRNApp"
                                                  initialProperties:nil
                                                      launchOptions:nil];
//必须强制刷新UI
    [self.rnView layoutIfNeeded];

    rootView.frame = self.rnView.bounds;
    [self.rnView addSubview:rootView];

}

//原生给RN发送通知
- (IBAction)clickAction:(id)sender {
    _infoLab.text = @"测试发送事件给JavaScript";
    [[NSNotificationCenter defaultCenter] postNotificationName:@"receive_notification_test" object:nil userInfo:@{@"name": @"test send message"}];
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
