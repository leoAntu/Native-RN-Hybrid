//
//  NativetoRNManager.m
//  NativeRNDemo
//
//  Created by 叮咚钱包富银 on 2018/3/6.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "NativetoRNManager.h"
#import <React/RCTConvert.h>
#import <React/RCTBridge.h>

@implementation NativetoRNManager
{
    bool hasListeners;
}
//  必须导入默认名称 ，你的类需要包含RCT_EXPORT_MODULE()宏
RCT_EXPORT_MODULE()

#pragma mark  Native和RN 通过通知监听相互通信

//必须覆盖此方法，要不然运行崩溃
- (NSArray<NSString *> *)supportedEvents
{
    return @[@"EventReminder"];
}

//  进行设置封装常量给JavaScript进行调用
-(NSDictionary *)constantsToExport{
    // 此处定义的常量为js订阅原生通知的通知名
    return @{@"receiveNotificationName":@"receive_notification_test"};
}

//  开始订阅通知事件
RCT_EXPORT_METHOD(startReceiveNotification:(NSString *)name) {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(nativeEventReceived:)
                                                 name:name
                                               object:nil];
}

- (void)nativeEventReceived:(NSNotification *)notification {
    NSString *name = [notification userInfo][@"name"];
    if (hasListeners) {
        [self sendEventWithName:@"EventReminder" body:@{@"name": name}];
    }
}

#pragma mark --- 优化监听事件
- (void)startObserving {
    hasListeners = YES;
}

- (void)stopObserving {
    hasListeners = NO;
}

@end
