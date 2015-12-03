//
//  main.m
//  01-AssembleComputer
//
//  Created by 王亓泰 on 15/12/2.
//  Copyright (c) 2015年 QianFeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WQTResourceList.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        WQTResourceList * resourceList = [[WQTResourceList alloc] init];
        [resourceList refresh];
    }
    return 0;
}
