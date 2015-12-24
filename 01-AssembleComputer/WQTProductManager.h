//
//  WQTProductManager.h
//  01-AssembleComputer
//
//  Created by 王亓泰 on 15/12/21.
//  Copyright © 2015年 QianFeng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WQTDeviceItem;
@interface WQTProductManager : NSObject
// 添加一个产品
- (void)addProduct:(WQTDeviceItem *)item;
// 返回所有产品
- (NSArray *)allProducts;

// 清空所有的产品
- (void)clearAllProducts;
// 返回单个产品
- (WQTDeviceItem *)productAtIndex:(NSUInteger)index;
@end
