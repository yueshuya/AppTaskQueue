//
//  ViewController.m
//  AppTaskQueueTest
//
//  Created by 陈中宝 on 2017/7/24.
//  Copyright © 2017年 陈中宝. All rights reserved.
//

#import "ViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <PhotosUI/PhotosUI.h>
#import "ZZTaskAlertController.h"
#import "ZZAppAlertTaskQueue.h"



@interface ViewController ()

@property (nonatomic, strong) NSOperationQueue *queue;

@property (nonatomic, strong) NSURLSession *session;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self _showALert];
}


- (void)_showALert {
    ZZTaskAlertController *alert2 = [ZZTaskAlertController alertControllerWithTitle:@"=========" message:@"2222222222" preferredStyle:(UIAlertControllerStyleAlert)];
    [alert2 addAction:[UIAlertAction actionWithTitle:@"cancel.." style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"closed ...");
    }]];
    [ZZAppAlertTaskQueue.instance addAlert:alert2 key:@"bbbbbbbbbbb"];
}



- (void)viewDidAppear:(BOOL)animated {
    [super  viewDidAppear:animated];

    
    ZZTaskAlertController *alert1 = [ZZTaskAlertController alertControllerWithTitle:@"1111111" message:@"111111111" preferredStyle:(UIAlertControllerStyleAlert)];
    [alert1 addAction:[UIAlertAction actionWithTitle:@"cancel.." style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"closed ...");
    }]];
    [ZZAppAlertTaskQueue.instance addAlert:alert1 key:@"aaaaaaaa"];
    
    
    
    ZZTaskAlertController *alert2 = [ZZTaskAlertController alertControllerWithTitle:@"222222222" message:@"2222222222" preferredStyle:(UIAlertControllerStyleAlert)];
    [alert2 addAction:[UIAlertAction actionWithTitle:@"cancel.." style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"closed ...");
    }]];
    [ZZAppAlertTaskQueue.instance addAlert:alert2 key:@"bbbbbbbbbbb"];


    ZZTaskAlertController *alert3 = [ZZTaskAlertController alertControllerWithTitle:@"333333333" message:@"33333333333" preferredStyle:(UIAlertControllerStyleAlert)];
    [alert3 addAction:[UIAlertAction actionWithTitle:@"cancel.." style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"closed ...");
    }]];
    [ZZAppAlertTaskQueue.instance addAlert:alert3 key:@"cccccccc"];
    
    
    
    
    
    
}








@end
