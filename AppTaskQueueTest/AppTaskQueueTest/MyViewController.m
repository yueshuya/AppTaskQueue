//
//  MyViewController.m
//  AppTaskQueueTest
//
//  Created by 陈中宝 on 2017/8/21.
//  Copyright © 2017年 陈中宝. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *bgColor = [UIColor colorWithRed:arc4random_uniform(255)/255.f green:arc4random_uniform(255)/255.f blue:arc4random_uniform(255)/255.f alpha:1];
    self.view.backgroundColor = bgColor;
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if (_dismissTask) {
        _dismissTask();
    }
}




@end
