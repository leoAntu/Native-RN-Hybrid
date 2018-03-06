
//
//  RNtoNativeManager.m
//  NativeRNDemo
//
//  Created by 叮咚钱包富银 on 2018/3/6.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "RNtoNativeManager.h"
#import <React/RCTConvert.h>
#import <React/RCTBridge.h>
#import <React/RCTEventDispatcher.h>  //事件派发，不导入会引起Xcode警告

@implementation RNtoNativeManager

@synthesize bridge=_bridge;
//  必须导入默认名称 ，你的类需要包含RCT_EXPORT_MODULE()宏
RCT_EXPORT_MODULE()

- (void)showInfo:(NSString *)info
{
    //  更新UI操作在主线程中执行
    dispatch_async(dispatch_get_main_queue(), ^{
        //Update UI in UI thread here
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"react_native_test" object:nil userInfo:@{@"info": info}];
    });
}

RCT_EXPORT_METHOD(testNormalEvent:(NSString *)name forSomething:(NSString *)thing) {
    NSString *info = [NSString stringWithFormat:@"Test: %@ For: %@", name, thing];
    [self showInfo:info];
}

RCT_EXPORT_METHOD(testDateEvent:(NSString *)name forSomething:(NSString *)thing time:(NSDate *)date) {
    [self showDate:date withName:name forSomething:thing];
}

RCT_EXPORT_METHOD(testDictionaryEvent:(NSString *)name details:(NSDictionary *) dictionary) {
    NSString *location = [RCTConvert NSString:dictionary[@"thing"]];
    NSDate *time = [RCTConvert NSDate:dictionary[@"time"]];
    NSString *description=[RCTConvert NSString:dictionary[@"description"]];
    
    NSString *info = [NSString stringWithFormat:@"Test: %@-For: %@-TestTime: %@-Description: %@",name,location,time,description];
    
    NSLog(@"%@", info);
    
    [self showInfo:info];
}

//  对外提供调用方法,演示Callback
RCT_EXPORT_METHOD(testCallbackEvent:(RCTResponseSenderBlock)callback)
{
    [self showInfo:@"测试callback"];
    
    NSArray *events=@[@"callback ", @"test ", @" array"];
    callback(@[[NSNull null],events]);
}

//promises方法使用 完美代替上述callback
RCT_REMAP_METHOD(findEvents,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    NSArray *events=@[@"promise ", @"test ", @" array"];
    if (events) {
        resolve(events);
    } else {
        NSError *error=[NSError errorWithDomain:@"我是Promise回调错误信息..." code:101 userInfo:nil];
        reject(@"101",@"13",error);
    }
}

- (void)showDate:(NSDate *)date withName:(NSString *)name forSomething:(NSString *)thing {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *info = [NSString stringWithFormat:@"Test: %@ For: %@ TestTime: %@", name, thing,[formatter stringFromDate:date]];
    
    NSLog(@"%@", info);
    
    [self showInfo:info];
}

@end
