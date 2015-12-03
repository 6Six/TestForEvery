//
//  Model.m
//  TestForEvery
//
//  Created by Garry on 15/11/25.
//  Copyright © 2015年 richinfo. All rights reserved.
//

#import "Model.h"
#import "Model+Property.h"

@implementation Model

+ (void)initialize
{
    [self invokeAllClassMethodWithSelector:@selector(categoryInitialize)];
}

@end
