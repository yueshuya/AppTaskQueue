//
//  ZZAppAlertTaskQueue.h
//  AppTaskQueueTest
//
//  Created by 陈中宝 on 2017/7/28.
//  Copyright © 2017年 陈中宝. All rights reserved.
/**
    App Alert 任务队列 - 为了防止 Alert 之间的冲突
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "singleton.h"


@interface ZZAppAlertTaskQueue : NSObject

@property (class, nonatomic, strong, readonly) ZZAppAlertTaskQueue *instance;

single_interface(ZZAppAlertTaskQueue)




/**
 添加一个新的 Alert
 
 @param alertVc Alert 控制器
 @param uniqueKey 标记 - 若对应的标记存在，那么后添加的无效
 */
- (void)addAlert:(UIAlertController *)alertVc key:(NSString *)uniqueKey;



@end
