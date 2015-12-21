
//
//  WQTDeviceItem.m
//  01-AssembleComputer
//
//  Created by 王亓泰 on 15/12/2.
//  Copyright (c) 2015年 QianFeng. All rights reserved.
//

#import "WQTDeviceItem.h"

@implementation WQTDeviceItem
- (NSString *)description {
    return [NSString stringWithFormat:@"名称:%@ 参考价格:%@",self.name,self.price];
}
@end
