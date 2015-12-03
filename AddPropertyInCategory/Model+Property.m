//
//  Model+Property.m
//  TestForEvery
//
//  Created by Garry on 15/11/25.
//  Copyright © 2015年 richinfo. All rights reserved.
//

#import "Model+Property.h"
#import <objc/runtime.h>

@implementation Model (Property)
@dynamic name, url, date;

//static void *kName = &kName;

//- (void)setName:(NSString *)name
//{
//    objc_setAssociatedObject(self, kName, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
//}
//
//- (NSString *)name
//{
//    return objc_getAssociatedObject(self, kName);
//}

+ (void)categoryInitialize
{
    [self addObjectProperty:@"name"];
    [self addObjectProperty:@"url"];
    [self addObjectProperty:@"date"];
}

+ (void)addObjectProperty:(NSString *)name
{
    //1. 通过class的指针和property的name，创建一个唯一的key
    NSString *key = [NSString stringWithFormat:@"%p_%@", self, name];
    
    //2. 用block实现setter方法
    id setBlock = ^(id self, id value) {
        objc_setAssociatedObject(self, (__bridge void *)key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    };
    
    //3. 将block的实现转化为IMP
    IMP imp = imp_implementationWithBlock(setBlock);
    
    //4. 用name拼接出setter方法
    NSString *selString = [self setMethodNameWithProperty:name];
    
    //5. 将setter方法加入到class中
    BOOL result = class_addMethod([self class], NSSelectorFromString(selString), imp, "v@:@");
//  将setter方法加入到class中。其中@"v@:@"：v表示空，setter的返回值为空。@表示id类型，第一个参数，也就是self为id类型。:表示SEL类型，第二个参数为method的selector。@表示id类型，第三个参数也就是setter方法真正要传入的参数为id类型。
    
    //6. getter
    id getBlock = ^id(id self) {
        return objc_getAssociatedObject(self, (__bridge void*)key);
    };
    
    IMP getImp = imp_implementationWithBlock(getBlock);
    result = class_addMethod([self class], NSSelectorFromString(name), getImp, "@@:");
}


+ (NSString *)setMethodNameWithProperty:(NSString *)name
{
    return [NSString stringWithFormat:@"set%@", name];
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

+ (void)invokeAllClassMethodWithSelector:(SEL)selector
{
    __invoke_all_method(self, selector);
}








@end
