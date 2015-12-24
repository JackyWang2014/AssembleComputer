//
//  WQTCpuItem.m
//  01-AssembleComputer
//
//  Created by 王亓泰 on 15/12/22.
//  Copyright © 2015年 QianFeng. All rights reserved.
//

#import "WQTCpuItem.h"

@implementation WQTCpuItem
// 重写父类的方法
- (void)setDictionary:(NSDictionary *)dict {
    [super setDictionary:dict];
    self.mainFrequency = dict[@"baseParam"][@"CPU主频"][@"1"];
}
@end
