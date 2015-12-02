//
//  WQTRequest.h
//  01-AssembleComputer
//
//  Created by 王亓泰 on 15/12/2.
//  Copyright (c) 2015年 QianFeng. All rights reserved.
//

#import <Foundation/Foundation.h>
// 负责整个工程的全部下载任务


@protocol WQTRequestDelegate  <NSObject>
// 通过这个方法回传数据,接收数据的对象,必须遵从协议,实现了这个方法
- (void)requestFinished:(NSData *)data;

@optional
// 用于回传错误原因
- (void)requestFailed:(NSString *)error;
@end




// 数据请求类,发送Get请求,通过Http协议请求数据
// 通过传入的URL,请求数据,最后通过回调,回传数据

@interface WQTRequest : NSObject
@property (nonatomic,assign) id<WQTRequestDelegate> delegate;

- (void)requestDataFromPath:(NSString *)urlStr;
@end
