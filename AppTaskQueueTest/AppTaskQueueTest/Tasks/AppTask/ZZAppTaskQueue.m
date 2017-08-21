//
//  ZZAppTaskQueue.m
//  AppTaskQueueTest
//
//  Created by 陈中宝 on 2017/7/28.
//  Copyright © 2017年 陈中宝. All rights reserved.
//

#import "ZZAppTaskQueue.h"


/**
 App Task 的状态

 - ZZAppTaskStateWaitting:  等待执行
 - ZZAppTaskStateRunning:   正在执行
 - ZZAppTaskStateCancelled: 被取消
 - ZZAppTaskStateFinished:  任务完成
 */
typedef NS_ENUM(NSInteger, ZZAppTaskState) {
    ZZAppTaskStateWaitting,
    ZZAppTaskStateRunning,
    ZZAppTaskStateCancelled,
    ZZAppTaskStateFinished
};


@interface __ZZAppTask : NSObject

@property (nonatomic, copy) NSString *taskID;
@property (nonatomic, assign) ZZAppTaskState state;
@property (nonatomic, copy) void(^task)(void(^completeHandler)(NSString *key));
@property (nonatomic, assign) NSUInteger priority; // 优先级

@end

@implementation __ZZAppTask



@end




@interface ZZAppTaskQueue() {
    dispatch_semaphore_t _semaphore;
}

@property (nonatomic, strong) NSMutableArray<__ZZAppTask *> *taskArr;

@property (nonatomic, weak) __ZZAppTask *runningTask;

@end


@implementation ZZAppTaskQueue

single_implementation(ZZAppTaskQueue)


- (void)loadData {
    _semaphore = dispatch_semaphore_create(1);
}





- (void)addTask:(void (^)(void (^)(NSString *)))taskBlock
       priority:(NSUInteger)priority
   forUniqueKey:(NSString *)key {
    if (key == nil || [@"" isEqualToString:key] || taskBlock == nil) {
        return;
    }
    
    if ([self _checkTaskExit:key]) {
        return;
    }
    
    __ZZAppTask *task = [[__ZZAppTask alloc] init];
    task.taskID = key;
    task.state = ZZAppTaskStateWaitting;
    task.task = taskBlock;
    task.priority = priority;
    
    [self _arrangeTask:task];
}



- (void)launchTasks {
    if (_runningTask) {
        return;
    }
    __ZZAppTask *task = nil;
    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
    if (self.taskArr.count > 0) {
        task = self.taskArr[0];
        task.state = ZZAppTaskStateRunning;
        _runningTask = task;
    }
    dispatch_semaphore_signal(_semaphore);
    if (task) {
        __weak typeof(self) ws = self;
        task.task(^(NSString *key) {
            for (int i = 0; i < ws.taskArr.count; i++) {
                __ZZAppTask *curTask = ws.taskArr[i];
                if ([curTask.taskID isEqualToString:key]) {
                    curTask.state = ZZAppTaskStateFinished;
                    [ws.taskArr removeObject:curTask];
                    // TODO NEXT
                    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                        [[ZZAppTaskQueue shareZZAppTaskQueue] launchTasks];
                    }];
                    break;
                }
            }
        });
    }
}



- (void)_arrangeTask:(__ZZAppTask *)task {
    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
    if (self.taskArr.count == 0) {
        [self.taskArr addObject:task];
    }else {
        for(int i = 0; i < self.taskArr.count; i++) {
            __ZZAppTask *curTask = self.taskArr[i];
            if (curTask.priority < task.priority) {
                [self.taskArr insertObject:task atIndex:i];
                break;
            }
        }
    }
    
    dispatch_semaphore_signal(_semaphore);
}



/**
 检查任务是否存在
 
 @return YES/NO
 */
- (BOOL)_checkTaskExit:(NSString *)key {
    BOOL exit = NO;
    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
    for(int i = 0; i < self.taskArr.count; i++) {
        __ZZAppTask *task = self.taskArr[i];
        if ([task.taskID isEqualToString:key]) {
            exit = YES;
            break;
        }
    }
    dispatch_semaphore_signal(_semaphore);
    return exit;
}



- (NSMutableArray<__ZZAppTask *> *)taskArr {
    if (!_taskArr) {
        _taskArr = [NSMutableArray array];
    }
    return _taskArr;
}

@end
