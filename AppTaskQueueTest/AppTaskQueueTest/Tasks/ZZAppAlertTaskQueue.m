//
//  ZZAppAlertTaskQueue.m
//  AppTaskQueueTest
//
//  Created by 陈中宝 on 2017/7/28.
//  Copyright © 2017年 陈中宝. All rights reserved.
//

#import "ZZAppAlertTaskQueue.h"


/**
 App Alert Task 的状态
 
 - ZZAppAlertTaskStateWaitting:  等待执行
 - ZZAppAlertTaskStateRunning:   正在执行
 - ZZAppAlertTaskStateCancelled: 被取消
 - ZZAppAlertTaskStateFinished:  任务完成
 */
typedef NS_ENUM(NSInteger, ZZAppAlertTaskState) {
    ZZAppAlertTaskStateWaitting,
    ZZAppAlertTaskStateRunning,
    ZZAppAlertTaskStateCancelled,
    ZZAppAlertTaskStateFinished
};


@interface __ZZAppAlertTask : NSObject

@property (nonatomic, copy) NSString *uniqueKey;

@property (nonatomic, strong) UIAlertController *alertVc;

@end

@implementation __ZZAppAlertTask

@end




@interface ZZAppAlertTaskQueue() {
    dispatch_semaphore_t _semaphore;
}


/**
    Alert 任务数组
 */
@property (nonatomic, strong) NSMutableArray<__ZZAppAlertTask *> *taskArr;

@end



@implementation ZZAppAlertTaskQueue


single_implementation(ZZAppAlertTaskQueue)

- (void)loadData {
    _semaphore = dispatch_semaphore_create(1);
}




- (void)addAlert:(UIAlertController *)alertVc key:(NSString *)uniqueKey {
    if ([self _taskForKey:uniqueKey]) {
        return;
    }
    __ZZAppAlertTask *task = [[__ZZAppAlertTask alloc] init];
    task.uniqueKey = uniqueKey;
    task.alertVc = alertVc;
    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
    [self.taskArr addObject:task];
    dispatch_semaphore_signal(_semaphore);
    [self _resumeTasks];
}



/**
 激活任务队列
 */
- (void)_resumeTasks {
    
}




- (__ZZAppAlertTask *)_taskForKey:(NSString *)uniqueKey {
    if (!uniqueKey || [@"" isEqualToString:uniqueKey]) {
        return nil;
    }
    __ZZAppAlertTask *target = nil;
    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
    for (__ZZAppAlertTask *task in self.taskArr) {
        if ([uniqueKey isEqualToString:task.uniqueKey]) {
            target = task;
            break;
        }
    }
    dispatch_semaphore_signal(_semaphore);
    return target;
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
