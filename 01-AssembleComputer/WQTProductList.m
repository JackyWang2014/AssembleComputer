//
//  WQTProductList.m
//  01-AssembleComputer
//
//  Created by 王亓泰 on 15/12/21.
//  Copyright © 2015年 QianFeng. All rights reserved.
//

#import "WQTProductList.h"
#import "WQTProductManager.h"
#import "WQTDeviceItem.h"
#import "WQTEventManager.h"
#import "Header.h"
enum {
 REFRESH,
    CHOOSE
};



@interface WQTProductList () {
    WQTProductManager * _productManager; // 数据源
    WQTRequest * _request; // 负责数据的请求
    // 负责当前页的事件管理
    WQTEventManager * _eventManager;
    // 当前页是否退出
    BOOL _isExit;
}




@end

@implementation WQTProductList
// 具体操作
- (void)refresh {
    // 首先请求数据
   
    NSLog(@"\n欢迎挑选所需%@",[WQTTool translation:self.deviceName]);
    [self requestData];
    // 注册相关操作
    [self registerEvents];
    while (!_isExit) {
        printf("请选择操作:\n0.刷新列表\n1.选择产品\n");
        NSUInteger ctrl;
        scanf("%ld",&ctrl);
        // 根据输入,响应事件
        [_eventManager respondedEvent:ctrl];
    }
}

#pragma mark - 事件管理
// 注册事件

- (void)registerEvents {
    if (_eventManager == nil) {
        _eventManager = [[WQTEventManager alloc] init];
    }
    [_eventManager addTarget:self action:@selector(requestData) event:REFRESH];
    [_eventManager addTarget:self action:@selector(chooseProduct) event:CHOOSE];
}

#pragma mark - 数据请求
// 发送请求
- (void)requestData {
    if (_request == nil) {
        _request = [[WQTRequest alloc] init];
        _request.delegate = self;
    }
    // 当前对象,委托request发送请求,下载数据,这里不适用协议
    [_request requestDataFromPath:self.url];
}

- (void)requestFinished:(NSData *)data {
//    NSLog(@"下到数据!");
    
    if (_productManager == nil) {
        _productManager = [[WQTProductManager alloc] init];
    }
    
    // 这里应该将元数据清空
    [_productManager clearAllProducts];
    
    // 解析数据,存储数据
    NSArray * array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    Class DeviceClass = NSClassFromString([WQTTool classNameFromDeviceName:self.deviceName]);
    
    for (NSDictionary * dict in array) {
        // 每个字典是一个产品
        WQTDeviceItem * item = [[DeviceClass alloc] init];
        // 这里如果是cpu对象,调用的就是cpu的setDictionary:方法
        [item setDictionary:dict];

        // 添加到数据源
        [_productManager addProduct:item];
    }
    
    [self showProducts];
}

// 尝试赋值


- (void)requestFailed:(NSString *)error {
    NSLog(@"下载失败:%@",error);
}

#pragma mark - 数据的列表
// 显示产品列表
- (void)showProducts {
    // 返回所有产品
    NSArray * products = _productManager.allProducts;
    NSMutableString * mutableStr = [[NSMutableString alloc] initWithString:@"{\n"];
    NSUInteger i = 0;
    for (WQTDeviceItem * item in products) {
        NSString * str = [NSString stringWithFormat:@"[%lu]%@\n",++i,item];
        [mutableStr appendString:str];
    }
    [mutableStr appendString:@"}"];
    NSLog(@"%@",mutableStr);
}

#pragma mark - 选择产品
- (void)chooseProduct {
    NSUInteger index;
    printf("请输入选择的产品编号:\n");
    scanf("%lu",&index);
    // 找到选择的产品
    WQTDeviceItem * item = [_productManager productAtIndex:index - 1];
    
    // 回传产品 通过协议或者block回调
    // 同时回传设备名
    [self.delegate chosedDevice:item deviceName:self.deviceName];
    
    // 回传数据之后,当前页返回
    _isExit = YES;
}

@end
