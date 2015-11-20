//
//  Father.m
//  TestForEvery
//
//  Created by Garry on 15/7/13.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "Father.h"
#import <objc/runtime.h>

@implementation Father

- (Class)class {
    return object_getClass(self);
}


@end
