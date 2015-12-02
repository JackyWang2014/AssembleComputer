//
//  WQTDeviceItem.h
//  01-AssembleComputer
//
//  Created by 王亓泰 on 15/12/2.
//  Copyright (c) 2015年 QianFeng. All rights reserved.
//

#import <Foundation/Foundation.h>
/**通用数据模型,用于储存单一设备模型,适用于各个页面*/
@interface WQTDeviceItem : NSObject
@property (nonatomic,copy) NSString * proid; //设备id
@property (nonatomic,copy) NSString * name;  // 产品名
@property (nonatomic,copy) NSString * price; // 均价
@property (nonatomic,copy) NSString * highPrice; // 高价
@property (nonatomic,copy) NSString * lowPrice; // 低价
@property (nonatomic,copy) NSString * fitType; // 使用
@property (nonatomic,copy) NSString * mainFrequency;// 主频
@end
