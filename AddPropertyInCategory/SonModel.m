
//
//  SonModel.m
//  TestForEvery
//
//  Created by Garry on 15/11/23.
//  Copyright © 2015年 richinfo. All rights reserved.
//

#import "SonModel.h"
#import <objc/runtime.h>


@implementation SonModel

- (void)sayHello
{
    NSLog(@"hey, son!");
}

- (void)loadSubView
{
//    [super loadSubView];
    
    NSLog(@"load son view");
}

static inline void __invoke_all_method(id self, SEL selector)
{
    // 1.根据self，获取class
    Class class = object_getClass(self);
    
    // 2.获取方法列表
    uint count;
    Method *methodList = class_copyMethodList(class, &count);
    
    // 3.遍历方法列表
    for (int index = 0; index < count; index++)
    {
        Method method = methodList[index];
        
        NSLog(@"%@", NSStringFromSelector(method_getName(method)));
        
        // 4.根据SEL查找方法
        if (!sel_isEqual(selector, method_getName(method)))
        {
            continue;
        }
        
        // 5.获取方法的实现
        IMP implement = method_getImplementation(method);
        
        // 6.直接调用方法的实现
        ((void(*)(id, SEL))implement)(self, selector);
    }
    
}

- (void)invokeAllClassMethodWithSelector:(SEL)selector
{
    __invoke_all_method(self, selector);
}



@end
