//
//  WQTResourceItem.m
//  01-AssembleComputer
//
//  Created by 王亓泰 on 15/12/2.
//  Copyright (c) 2015年 QianFeng. All rights reserved.
//

#import "WQTResourceItem.h"

@implementation WQTResourceItem
- (float)totalPrice {
    NSArray * propertyNames = @[@"cpu",
                                @"memory",
                                @"mainBoard",
                              @"graphicsCard",
                                @"voiceCard",
                                @"box",
                                @"hardDisk",
                                @"keyboard",
                                @"displayer"];
    
    float totalPrice = 0;
    for (NSString * propertyName in propertyNames) {
        WQTDeviceItem * item = [self performSelector:NSSelectorFromString(propertyName)];
        if (item != nil) {
        totalPrice += item.price.floatValue;
        }
    }
    return totalPrice;
    
}
@end
