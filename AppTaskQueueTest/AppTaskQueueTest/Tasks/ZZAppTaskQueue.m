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
//@property (nonatomic, )

@end

@implementation __ZZAppTask



@end




@implementation ZZAppTaskQueue

@end
