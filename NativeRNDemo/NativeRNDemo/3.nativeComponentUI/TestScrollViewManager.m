
//
//  TestScrollViewManager.m
//  NativeRNDemo
//
//  Created by 叮咚钱包富银 on 2018/3/6.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "TestScrollViewManager.h"
#import <React/RCTConvert.h>
#import <React/RCTBridge.h>           //进行通信的头文件
#import <React/RCTEventDispatcher.h>  //事件派发，不导入会引起Xcode警告
#import "TestScrollView.h"
#import <React/UIView+React.h>

@interface TestScrollViewManager() <SDCycleScrollViewDelegate>

@end

@implementation TestScrollViewManager
RCT_EXPORT_MODULE()

//导出到JS中
RCT_EXPORT_VIEW_PROPERTY(autoScrollTimeInterval, CGFloat);

RCT_EXPORT_VIEW_PROPERTY(imageURLStringsGroup, NSArray);

RCT_EXPORT_VIEW_PROPERTY(autoScroll, BOOL);

RCT_EXPORT_VIEW_PROPERTY(pageControlAliment, NSInteger);

RCT_EXPORT_VIEW_PROPERTY(onClickBanner, RCTBubblingEventBlock)

- (UIView *)view {
    TestScrollView *scrollView = [TestScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:nil];
    scrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    return scrollView;
}

- (NSDictionary *)constantsToExport
{
    return @{
             @"SDCycleScrollViewPageContolAliment": @{
                     @"right": @(SDCycleScrollViewPageContolAlimentRight),
                     @"center": @(SDCycleScrollViewPageContolAlimentCenter)
                     }
             };
}


#pragma mark SDCycleScrollViewDelegate
- (void)cycleScrollView:(TestScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    if (!cycleScrollView.onClickBanner) {
        return;
    }
    NSLog(@"oc did click %li", [cycleScrollView.reactTag integerValue]);
    cycleScrollView.onClickBanner(@{@"target": cycleScrollView.reactTag,
                                    @"value": [NSNumber numberWithInteger:index+1]
                                    });
}

@end
