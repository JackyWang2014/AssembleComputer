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
#import "WQTURLItemManager.h"
#import "WQTProductList.h"
#import "WQTURLItem.h"
enum {
    REFRESH, // 刷新当前配置
    CHOOSE_DEVICE
};

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
    // 管理数据操作数据,将接口和后台数据结合起来
    while (1) {
        NSUInteger ctl;
        printf("请选择操作:\n0:刷新当前页\n1:挑选某个设备");
        scanf("%lu",&ctl);
        [_eventManager respondedEvent:ctl];
    }
}
// 注册相关事件
- (void)registerEvents {
    // 注册第0个事件
    [_eventManager addTarget:self action:@selector(reloadSource) event:REFRESH];
    [_eventManager addTarget:self action:@selector(chooseDevice) event:CHOOSE_DEVICE];
//    [_eventManager respondedEvent:0];
}

#pragma mark - 显示列表和价格
- (void)reloadSource {
    NSMutableString * str = [[NSMutableString alloc] initWithString:@"{\n商品清单:\n"];
    
    NSArray * propertyNames = DEVICE_PROPERTY_NAMES;
    
    NSInteger i = 0;
    for (NSString * propertyName in propertyNames) {
        [str appendFormat:@"[%ld]%@:",++i,[WQTTool translation:propertyName]];
        WQTDeviceItem * item = [_resourceItem performSelector:NSSelectorFromString(propertyName)];
        if (item) {
            [str appendFormat:@"%@  ￥,%@",item.name,item.price];;
        } else {
            [str appendString:@"(暂无设备)"];
        }
        [str appendString:@"\n"];
    }
    [str appendFormat:@"总价:%.2f",_resourceItem.totalPrice];
    
    NSLog(@"%@}",str);
}

#pragma mark - 选择一种设备
// 做第二次输入,选择设备
- (void)chooseDevice {
    NSUInteger ctl;
    printf("请依据设备编号选择设备:\n");
    scanf("%lu",&ctl);
    
    //推出第二个界面
    WQTURLItem * urlItem = [WQTURLItemManager urlItemAtIndex:ctl];
   
    if (urlItem == nil) {
        NSLog(@"输入错误,请重试");
        return;
    }
    // 创建第二个界面
    WQTProductList * productList = [[WQTProductList alloc] init];
     // 建立代理联系
    productList.delegate = self;
     // 设置标题和网址
    productList.deviceName = urlItem.deviceName;
    productList.url = urlItem.url;
    [productList refresh];
    
    // 第二个界面返回
    [self reloadSource];
    
}

#pragma mark - productListDelegate协议方法的实现
// 获得被选择的设备
- (void)chosedDevice:(WQTDeviceItem *)item deviceName:(NSString *)deviceName {
    // deviceName源自resourceItem的属性
    NSString * setMethod = [self setMethodNameFromPropertyName:deviceName];
    [_resourceItem performSelector:NSSelectorFromString(setMethod) withObject:item];
}

- (NSString *)setMethodNameFromPropertyName:(NSString *)
                                             proName {
                                                 // 取出第一个字符
    unichar c = [proName characterAtIndex:0];
    c = toupper(c);// 小写字符转大写,如果已经是大写,或者不是字母,不变
    NSString * newStr = [NSString stringWithFormat:@"set%C%@:",c,[proName substringFromIndex:1]];
    return newStr;
}
@end
