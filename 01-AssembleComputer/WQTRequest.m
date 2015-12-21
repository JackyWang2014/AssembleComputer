//
//  WQTRequest.m
//  01-AssembleComputer
//
//  Created by 王亓泰 on 15/12/2.
//  Copyright (c) 2015年 QianFeng. All rights reserved.
//

#import "WQTRequest.h"

@implementation WQTRequest
- (void)requestDataFromPath:(NSString *)urlStr {
    
    NSThread * thread = [[NSThread alloc] initWithTarget:self selector:@selector(download:) object:urlStr];
    
    [thread start];
    
}

- (void)download:(NSString *)urlStr {
    // 删除原有的编码格式,转成UTF8
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL * url = [NSURL URLWithString:urlStr];
    NSData * data = [NSData dataWithContentsOfURL:url];
    // 回传数据
    NSString * error = nil;
    if (data == nil) {
        if (url == nil) {
            // http请求中存在非法的字符
            error = @"http语句中存在非法字符";
        } else {
            // 网络不畅或者http内容错误
            error = @"检查你的网络和http路径";
        }
        
        // 判断接收方是否实现了这个方法
        if ([self.delegate respondsToSelector:@selector(requestFailed:)]) {
            // 回传错误原因
            [self.delegate requestFailed:error];
        }
    } else {
        // 回传数据
        [self.delegate requestFinished:data];
    }
}


@end
