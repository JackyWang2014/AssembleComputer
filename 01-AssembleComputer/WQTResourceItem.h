//
//  WQTResourceItem.h
//  01-AssembleComputer
//
//  Created by 王亓泰 on 15/12/2.
//  Copyright (c) 2015年 QianFeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WQTDeviceItem.h"
/**一台主机配置的数据模型,储存一台主机的cpu 显卡等数据*/
@interface WQTResourceItem : NSObject
@property (nonatomic,strong) WQTDeviceItem * cpu;
@property (nonatomic,strong) WQTDeviceItem * memory;
@property (nonatomic,strong) WQTDeviceItem * mainBoard;
@property (nonatomic,strong) WQTDeviceItem * graphicsCard;
@property (nonatomic,strong) WQTDeviceItem * voiceCard;
@property (nonatomic,strong) WQTDeviceItem * box;
@property (nonatomic,strong) WQTDeviceItem * hardDisk;
@property (nonatomic,strong) WQTDeviceItem * keyboard;
@property (nonatomic,strong) WQTDeviceItem * displayer;
- (float)totalPrice;
@end
