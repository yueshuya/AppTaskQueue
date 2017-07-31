//
//  ZZTaskAlertController.m
//  AppTaskQueueTest
//
//  Created by 陈中宝 on 2017/7/31.
//  Copyright © 2017年 陈中宝. All rights reserved.
//

#import "ZZTaskAlertController.h"

@interface ZZTaskAlertController ()

@end

@implementation ZZTaskAlertController

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if (_alertDismissTask) {
        _alertDismissTask();
    }
}


- (void)dealloc {
    NSLog(@" Alert is dealloc -------");
}

@end
