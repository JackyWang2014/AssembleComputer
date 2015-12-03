//
//  WQTEventItem.h
//  01-AssembleComputer
//
//  Created by 王亓泰 on 15/12/3.
//  Copyright (c) 2015年 QianFeng. All rights reserved.
//

#import <Foundation/Foundation.h>
/**事件的数据模型*/
@interface WQTEventItem : NSObject
@property (nonatomic,strong) id target;
@property (nonatomic,assign) SEL action;
@end
