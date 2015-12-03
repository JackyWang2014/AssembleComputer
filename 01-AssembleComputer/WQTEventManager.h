//
//  WQTEventManager.h
//  01-AssembleComputer
//
//  Created by 王亓泰 on 15/12/3.
//  Copyright (c) 2015年 QianFeng. All rights reserved.
//

#import <Foundation/Foundation.h>
/**事件管理器,负责分发事件*/
@interface WQTEventManager : NSObject
// 注册事件
- (void)addTarget:(id)target action:(SEL)action event:(NSUInteger)event;
// 相应事件 根据编号,响应对应的事件
- (void)respondedEvent:(NSUInteger)event;
@end
