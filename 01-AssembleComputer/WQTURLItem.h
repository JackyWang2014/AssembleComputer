//
//  WQTURLItem.h
//  01-AssembleComputer
//
//  Created by 王亓泰 on 15/12/21.
//  Copyright © 2015年 QianFeng. All rights reserved.
//

#import <Foundation/Foundation.h>
// 存储所选择的设备,如cpu,显卡等

@interface WQTURLItem : NSObject
@property (nonatomic,assign) NSUInteger deviceId;
@property (nonatomic,copy) NSString * deviceName; // CPU等
@property (nonatomic,copy) NSString * url; // 对应GET请求

@end
