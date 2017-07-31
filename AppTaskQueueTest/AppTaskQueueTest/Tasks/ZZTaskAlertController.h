//
//  ZZTaskAlertController.h
//  AppTaskQueueTest
//
//  Created by 陈中宝 on 2017/7/31.
//  Copyright © 2017年 陈中宝. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZTaskAlertController : UIAlertController

@property (nonatomic, copy) void(^alertDismissTask)();

@end
