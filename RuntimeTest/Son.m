//
//  Son.m
//  TestForEvery
//
//  Created by Garry on 15/7/13.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "Son.h"

@implementation Son

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        NSLog(@"%@", NSStringFromClass([self class]));
        NSLog(@"%@", NSStringFromClass([super class]));
    }
    
    return self;
}

- (void)print
{
    NSLog(@"%@", NSStringFromClass([self class]));
    NSLog(@"%@", NSStringFromClass([super class]));
}

@end
