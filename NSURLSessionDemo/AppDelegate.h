//
//  AppDelegate.h
//  NSURLSessionDemo
//
//  Created by Garry on 15/10/29.
//  Copyright © 2015年 richinfo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, copy) void (^ backgroundSessionCompleteHandler) (BOOL isFinished);

@end

