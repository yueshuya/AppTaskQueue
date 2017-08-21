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
 
 */



#import <Foundation/Foundation.h>
#import "singleton.h"

@interface ZZAppTaskQueue : NSObject

single_interface(ZZAppTaskQueue)



/**
 添加一个任务
 
 @param task        任务 - 这个里面的 completeHandler 一定要在你的任务完成之后调用一下，来表明你的任务完成了，否则会认为你的任务一直没有完成。
 @param priority    优先级
 @param key         唯一标识
 */
- (void)addTask:(void(^)(void(^completeHandler)(NSString *key)))task
       priority:(NSUInteger)priority
   forUniqueKey:(NSString *)key;



/**
 设置可以运行 - 这个一定要找一个地方进行设置，最好是根控制器的 didAppear 或者 AppDelegate 的 -applicationDidBecomeActive 里面
 */
- (void)readyToRun;




@end
