//
//  MyViewController.h
//  AppTaskQueueTest
//
//  Created by 陈中宝 on 2017/8/21.
//  Copyright © 2017年 陈中宝. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyViewController : UIViewController


@property (nonatomic, copy) void(^dismissTask)();

@end
