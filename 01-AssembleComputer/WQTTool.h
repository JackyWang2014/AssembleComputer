//
//  WQTTool.h
//  01-AssembleComputer
//
//  Created by 王亓泰 on 15/12/3.
//  Copyright (c) 2015年 QianFeng. All rights reserved.
//

#import <Foundation/Foundation.h>
/**工具类,提供相关的一些辅助功能*/
@interface WQTTool : NSObject
/**翻译*/
+ (NSString *)translation:(NSString *)eng;
// 通过设备名,返回对应对象
+ (NSString *)classNameFromDeviceName:(NSString *)deviceName;
@end
