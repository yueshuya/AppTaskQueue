//
//  ZZAppAlertTaskQueue.m
//  AppTaskQueueTest
//
//  Created by 陈中宝 on 2017/7/28.
//  Copyright © 2017年 陈中宝. All rights reserved.
//

#import "ZZAppAlertTaskQueue.h"

@interface __ZZAppAlertTask : NSObject

@property (nonatomic, copy) NSString *uniqueKey;

@property (nonatomic, strong) UIAlertController *alertVc;

@end

@implementation __ZZAppAlertTask

@end




@interface ZZAppAlertTaskQueue() {
//    dispatch_semaphore_t 
}

@property (nonatomic, strong) NSMutableArray<__ZZAppAlertTask *> *taskArr;

@end



@implementation ZZAppAlertTaskQueue


single_implementation(ZZAppAlertTaskQueue)

- (void)loadData {}




- (void)addAlert:(UIAlertController *)alertVc key:(NSString *)uniqueKey {
    
}









/**
 检查对应的 uniqueKey 是否已存在对应的任务
 
 @param uniqueKey 唯一标记
 @return YES/NO
 */
- (BOOL)_checkDuplicate:(NSString *)uniqueKey {
    
    return NO;
}


- (NSMutableArray<__ZZAppAlertTask *> *)taskArr {
    if (!_taskArr) {
        _taskArr = [NSMutableArray array];
    }
    return _taskArr;
}

+ (ZZAppAlertTaskQueue *)instance {
    return [ZZAppAlertTaskQueue shareZZAppAlertTaskQueue];
}


@end
