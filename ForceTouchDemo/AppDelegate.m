//
//  AppDelegate.m
//  ForceTouchDemo
//
//  Created by Garry on 15/11/2.
//  Copyright © 2015年 richinfo. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//#pragma mark 获取当前应用程序的shortcutItems
//    // 获取当前应用程序对象
//    UIApplication *app = [UIApplication sharedApplication];
//    // 获取一个应用程序对象的shortcutItem列表
//    id existingShortcutItems = [app shortcutItems];
//    
//#pragma mark 修改当前应用程序的某个shortcutItem
//    // 获取第0个shortcutItem
//    id oldItem = [existingShortcutItems objectAtIndex:0];
//    // 将旧的shortcutItem改变为可修改类型shortcutItem
//    id mutableItem = [oldItem mutableCopy];
//    // 修改shortcutItem的显示标题
//    [mutableItem setLocalizedTitle:@"Click Leviws"];
//    
//#pragma mark 重置当前应用程序的shortcutItems
//    // 根据旧的shortcutItems生成可变的shortcutItems数组
//    id updatedShortcutItems = [existingShortcutItems mutableCopy];
//    // 修改可变shortcutitems数组中对应index下的元素为新的shortcutItem
//    [updatedShortcutItems replaceObjectAtIndex:0 withObject:mutableItem];
//    // 修改应用程序对象的shortcutItem为新的数组
//    [app setShortcutItems:updatedShortcutItems];
    
    UIApplicationShortcutItem *scanItem = [[UIApplicationShortcutItem alloc] initWithType:@"scan"
                                                                           localizedTitle:@"scan"
                                                                        localizedSubtitle:@"123"
                                                                                     icon:[UIApplicationShortcutIcon iconWithTemplateImageName:@"wifi"]
                                                                                 userInfo:nil];
    UIApplicationShortcutItem *readItem = [[UIApplicationShortcutItem alloc] initWithType:@"read"
                                                                           localizedTitle:@"read"
                                                                        localizedSubtitle:@"4847"
                                                                                     icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAlarm]
                                                                                 userInfo:nil];
    
    
    
    [[UIApplication sharedApplication] setShortcutItems:@[scanItem, readItem]];
    
    return YES;
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    NSLog(@"a shortcut item was pressed. It was %@", shortcutItem.localizedTitle);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
