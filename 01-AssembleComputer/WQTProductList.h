//
//  WQTProductList.h
//  01-AssembleComputer
//
//  Created by 王亓泰 on 15/12/21.
//  Copyright © 2015年 QianFeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WQTRequest.h"
// 产品列表,管理并显示一个设备的产品,并可选择设备,回传给前一个页面
@interface WQTProductList : NSObject <WQTRequestDelegate>
@property (nonatomic,copy) NSString * url;
@property (nonatomic,copy) NSString * deviceName;
// 刷新
- (void)refresh;

@end
