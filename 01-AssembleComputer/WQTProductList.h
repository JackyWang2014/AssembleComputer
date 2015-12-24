//
//  WQTProductList.h
//  01-AssembleComputer
//
//  Created by 王亓泰 on 15/12/21.
//  Copyright © 2015年 QianFeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WQTRequest.h"
@class WQTDeviceItem;
@protocol WQTProductListDelegate <NSObject>
//选中了某个设备,回调这个方法
- (void)chosedDevice:(WQTDeviceItem *)item deviceName:(NSString *)deviceName;

@end
// 产品列表,管理并显示一个设备的产品,并可选择设备,回传给前一个页面
@interface WQTProductList : NSObject <WQTRequestDelegate>
// 指向代理对象的指针,将会指向配置列表
@property (nonatomic,assign) id<WQTProductListDelegate> delegate;
// 要请求的url
@property (nonatomic,copy) NSString * url;
@property (nonatomic,copy) NSString * deviceName;
// 刷新
- (void)refresh;

@end
