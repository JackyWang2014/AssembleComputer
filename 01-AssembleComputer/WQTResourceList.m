//
//  WQTResourceList.m
//  01-AssembleComputer
//
//  Created by 王亓泰 on 15/12/2.
//  Copyright (c) 2015年 QianFeng. All rights reserved.
//

#import "WQTResourceList.h"
#import "WQTResourceItem.h"
#import "WQTDeviceItem.h"
#import "WQTEventManager.h"
#import "WQTEventItem.h"
#import "Header.h"
@interface WQTResourceList() {
    // 当前类管理的数据模型
    WQTResourceItem * _resourceItem;
    // 管理当前页所有的操作
    WQTEventManager * _eventManager;
}

@end


@implementation WQTResourceList

- (instancetype)init {
    if (self = [super init]) {
        _resourceItem = [[WQTResourceItem alloc] init];
        _eventManager = [[WQTEventManager alloc] init];
    }
    return  self;
}

#pragma mark - 管理数据

// 页面运行 刷新
- (void)refresh {
    // 搭建基础的工作体系
    [self registerEvents];
    // 主界面不退出
    while (1) {
        NSUInteger ctl;
        printf("请选择操作:\n0:刷新当前页\n");
        scanf("%lu",&ctl);
        [_eventManager respondedEvent:ctl];
    }
    
    
}
// 注册相关事件
- (void)registerEvents {
    // 注册第0个事件
    [_eventManager addTarget:self action:@selector(reloadSource) event:0];
//    [_eventManager respondedEvent:0];
}

#pragma mark - 显示列表和价格
- (void)reloadSource {
    NSMutableString * str = [[NSMutableString alloc] initWithString:@"{\n商品清单:\n"];
    
    NSArray * propertyNames = DEVICE_PROPERTY_NAMES;
    for (NSString * propertyName in propertyNames) {
        [str appendFormat:@"%@:",propertyName];
        WQTDeviceItem * item = [_resourceItem performSelector:NSSelectorFromString(propertyName)];
        if (item) {
            [str appendFormat:@"%@  ￥,%@",item.name,item.price];;
        }
        [str appendString:@"\n"];
    }
    NSLog(@"%@}",str);
}

@end
