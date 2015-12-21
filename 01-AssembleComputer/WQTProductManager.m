//
//  WQTProductManager.m
//  01-AssembleComputer
//
//  Created by 王亓泰 on 15/12/21.
//  Copyright © 2015年 QianFeng. All rights reserved.
//

#import "WQTProductManager.h"
#import "WQTDeviceItem.h"

@interface WQTProductManager () {
    NSMutableArray * _array;
}

@end


@implementation WQTProductManager

- (instancetype)init {
    if (self = [super init]) {
        _array = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark -  相关操作
// 添加一个产品
- (void)addProduct:(WQTDeviceItem *)item {
    [_array addObject:item];
}
// 返回所有产品
- (NSArray *)allProducts {
    return _array;
}

// 返回单个产品
- (WQTDeviceItem *)productAtIndex:(NSUInteger)index {
    if (index >= _array.count) {
        return nil;
    }
    return _array[index];
}





@end
