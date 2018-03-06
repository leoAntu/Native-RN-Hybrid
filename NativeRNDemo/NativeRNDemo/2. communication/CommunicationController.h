//
//  CommunicationController.h
//  NativeRNDemo
//
//  Created by 叮咚钱包富银 on 2018/3/5.
//  Copyright © 2018年 leo. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, CommunicationControllerType) {
    NativeToRNbyNotification,
    RNToNative
    
};
@interface CommunicationController : UIViewController
@property (nonatomic, assign) CommunicationControllerType colloerType;
@end
