//
//  WQTURLItemManager.h
//  01-AssembleComputer
//
//  Created by 王亓泰 on 15/12/21.
//  Copyright © 2015年 QianFeng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WQTURLItem;

// 根据DeviceID,找到对应设备,返回设备的网址和标题
@interface WQTURLItemManager : NSObject
// 找到设备
+ (WQTURLItem *)urlItemAtIndex:(NSUInteger)index;
@end
