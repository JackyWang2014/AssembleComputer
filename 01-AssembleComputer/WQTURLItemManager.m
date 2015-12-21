//
//  WQTURLItemManager.m
//  01-AssembleComputer
//
//  Created by 王亓泰 on 15/12/21.
//  Copyright © 2015年 QianFeng. All rights reserved.
//

#import "WQTURLItemManager.h"
#import "Header.h"
#import "WQTURLItem.h"
@interface WQTURLItemManager () {
    NSMutableDictionary * _dict;
}

@end

@implementation WQTURLItemManager
- (instancetype)init {
    if (self = [super init]) {
        _dict = [[NSMutableDictionary alloc] init];
        [self addData];
    }
    return self;
}

/*
 [1]CPU:(暂无设备)
 [2]内存:(暂无设备)
 [3]主板:(暂无设备)
 [4]显卡:(暂无设备)
 [5]声卡:(暂无设备)
 [6]机箱:(暂无设备)
 [7]硬盘:(暂无设备)
 [8]键盘:(暂无设备)
 [9]显示器 :(暂无设备)
 
 */
// 添加数据
- (void)addData {
    NSArray * deviceNames = DEVICE_PROPERTY_NAMES;
    NSArray * urls = @[URL_CPU,URL_MEMORY,URL_MAINBOARD];
    
    for (NSUInteger i = 0; i < deviceNames.count; i++) {
        // 创建对象 存储对象
        WQTURLItem * item = [[WQTURLItem alloc] init];
        item.deviceId = i + 1;
        item.deviceName = deviceNames[i];
        if (i < urls.count) {
            item.url = urls[i];
        }
        
        [_dict setObject:item forKey:[NSString stringWithFormat:@"%lu", i + 1]];
        
    }
}

- (WQTURLItem *)urlItemAtIndex:(NSUInteger)index {
    return _dict[[NSString stringWithFormat:@"%lu",index] ];
}

+ (WQTURLItem *)urlItemAtIndex:(NSUInteger)index {
    WQTURLItemManager * manager = [[WQTURLItemManager alloc] init];
    WQTURLItem * item = [manager urlItemAtIndex:index];
    return item;
}

@end
