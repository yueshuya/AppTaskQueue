//
//  ZZAppAlertTaskQueue.m
//  AppTaskQueueTest
//
//  Created by 陈中宝 on 2017/7/28.
//  Copyright © 2017年 陈中宝. All rights reserved.
//

#import "ZZAppAlertTaskQueue.h"

@implementation ZZAppAlertTaskQueue


single_implementation(ZZAppAlertTaskQueue)

- (void)loadData {}


+ (ZZAppAlertTaskQueue *)instance {
    return [ZZAppAlertTaskQueue shareZZAppAlertTaskQueue];
}


@end
