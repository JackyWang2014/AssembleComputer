
//
//  WQTEventManager.m
//  01-AssembleComputer
//
//  Created by 王亓泰 on 15/12/3.
//  Copyright (c) 2015年 QianFeng. All rights reserved.
//

#import "WQTEventManager.h"
#import "WQTEventItem.h"
@interface WQTEventManager() {
    NSMutableDictionary * _dict;
}

@end

@implementation WQTEventManager
- (instancetype)init {
    if (self = [super init]) {
        _dict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)addTarget:(id)target action:(SEL)action event:(NSUInteger)event {
    WQTEventItem * eventItem = [[WQTEventItem alloc] init];
    eventItem.target = target;
    eventItem.action = action;
    [_dict setObject:eventItem forKey:[NSString stringWithFormat:@"%lu",event]];
}


- (void)respondedEvent:(NSUInteger)event {
    WQTEventItem * eventItem = _dict[[NSString stringWithFormat:@"%lu",event] ];
    if (eventItem == nil) {
        return;
    }
    
    // 响应事件
    [eventItem.target performSelector:eventItem.action];
    
}

















@end
