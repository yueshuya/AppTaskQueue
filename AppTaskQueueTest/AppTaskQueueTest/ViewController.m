//
//  ViewController.m
//  AppTaskQueueTest
//
//  Created by 陈中宝 on 2017/7/24.
//  Copyright © 2017年 陈中宝. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"begin >>>>>>>>>>>>>>>>>>>>>");
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            for (int i = 0; i < 100; i++) {
                NSLog(@"==============%d", i);
                sleep(1);
            }
        });
        
        NSLog(@"end <<<<<<<<<<<<<<<<<<<<<<<");
    }];
    
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"begin ---------------------");
        
        NSLog(@"]]]]]]]]]]]]]]]]]]]");
        
        NSLog(@"end ++++++++++++++++++++++");
    }];
    
    [op2 addDependency:op1];
    
    
    _queue = [[NSOperationQueue alloc] init];
    [_queue addOperation:op1];
    
    [_queue addOperation:op2];
}





@end
