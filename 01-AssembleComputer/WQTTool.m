//
//  WQTTool.m
//  01-AssembleComputer
//
//  Created by 王亓泰 on 15/12/3.
//  Copyright (c) 2015年 QianFeng. All rights reserved.
//

#import "WQTTool.h"

@implementation WQTTool
// 将英文翻译成中文
+ (NSString *)translation:(NSString *)eng {
    NSDictionary * dict = @{@"cpu":@"CPU",@"memory":@"内存",@"mainBoard":@"主板",@"graphicsCard":@"显卡",@"voiceCard":@"声卡",@"box":@"机箱",@"hardDisk":@"硬盘",@"keyboard":@"键盘",@"displayer":@"显示器 "                   };
    NSString * chiWord = dict[eng];
    if (chiWord) {
        return chiWord;
    }
    return eng;
}

// 通过设备名,返回对应对象
+ (NSString *)classNameFromDeviceName:(NSString *)deviceName {
    NSDictionary * dic = @{
                           @"cpu" : @"WQTCpuItem",
                           @"memory" : @"WQTMemoryItem",
                           @"mainBoard" : @"WQTMainboardItem"
                           };
    return dic[deviceName];
}

@end
