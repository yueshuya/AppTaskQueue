//
//  AppDelegate.m
//  AppTaskQueueTest
//
//  Created by 陈中宝 on 2017/7/24.
//  Copyright © 2017年 陈中宝. All rights reserved.
//

#import "AppDelegate.h"
#import "ZZAppTaskQueue.h"
#import "MyViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[ZZAppTaskQueue shareZZAppTaskQueue] addTask:^(void (^completeHandler)(NSString *key)) {
        MyViewController *vc = [[MyViewController alloc] init];
        vc.dismissTask = ^{
            completeHandler(@"1");
        };
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:vc animated:YES completion:^{
            NSLog(@"11111111111111");
        }];
    } priority:1 forUniqueKey:@"1"];
    
    
    [[ZZAppTaskQueue shareZZAppTaskQueue] addTask:^(void (^completeHandler)(NSString *key)) {
        MyViewController *vc = [[MyViewController alloc] init];
        vc.dismissTask = ^{
            completeHandler(@"2");
        };
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:vc animated:YES completion:^{
            NSLog(@"2222222222222222");
        }];
    } priority:2 forUniqueKey:@"2"];
    
    
    [[ZZAppTaskQueue shareZZAppTaskQueue] addTask:^(void (^completeHandler)(NSString *key)) {
        MyViewController *vc = [[MyViewController alloc] init];
        vc.dismissTask = ^{
            completeHandler(@"3");
        };
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:vc animated:YES completion:^{
            NSLog(@"3333333333333");
        }];
    } priority:3 forUniqueKey:@"3"];
    
    
    [[ZZAppTaskQueue shareZZAppTaskQueue] addTask:^(void (^completeHandler)(NSString *key)) {
        MyViewController *vc = [[MyViewController alloc] init];
        vc.dismissTask = ^{
            completeHandler(@"4");
        };
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:vc animated:YES completion:^{
            NSLog(@"444444444444");
        }];
    } priority:4 forUniqueKey:@"4"];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
