//
//  ZZAppTaskQueue.h
//  AppTaskQueueTest
//
//  Created by 陈中宝 on 2017/7/28.
//  Copyright © 2017年 陈中宝. All rights reserved.
//


/**

    1、可以设置任务优先级
    2、只要串行
    3、异步任务也必须等待执行完才能下一个
    4、任务之间可以设置依赖 (优先级低)
 
 
    非高优先级的任务执行时间过长则被丢弃，以便执行下一个。
 
     目前应用场景有限，只有一个：在 App 启动或者从挂起进入前台的时候使用。
 
 */



#import <Foundation/Foundation.h>
#import "singleton.h"

@interface ZZAppTaskQueue : NSObject

single_interface(ZZAppTaskQueue)



/**
 添加一个任务
 
 @param task        任务
 @param priority    优先级
 @param key         唯一标识
 */
- (void)addTask:(void(^)(void(^completeHandler)(NSString *key)))task
       priority:(NSUInteger)priority
   forUniqueKey:(NSString *)key;



#warning TODO 还有何时启动的问题

/**
 启动任务队列，不需要队列使用者手动调用
 */
- (void)launchTasks;



@end
