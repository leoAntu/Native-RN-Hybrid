//
//  TestScrollView.h
//  NativeRNDemo
//
//  Created by 叮咚钱包富银 on 2018/3/6.
//  Copyright © 2018年 leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
#import <React/RCTComponent.h>
@interface TestScrollView : SDCycleScrollView

@property (nonatomic, copy) RCTBubblingEventBlock onClickBanner;

@end
