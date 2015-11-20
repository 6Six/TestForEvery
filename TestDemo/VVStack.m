//
//  VVStack.m
//  TestForEvery
//
//  Created by Garry on 15/7/29.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "VVStack.h"

@interface VVStack ()

@property (nonatomic, strong) NSMutableArray *numbers;

@end

@implementation VVStack

- (instancetype)init
{
    if (self = [super init]) {
        _numbers = [NSMutableArray new];
    }
    
    return self;
}

- (void)push:(double)num
{
    [self.numbers addObject:@(num)];
}

- (double)top
{
    return [[_numbers lastObject] doubleValue];
}

- (NSInteger)count
{
    return self.numbers.count;
}

- (double)pop
{
    if ([self count] == 0) {
        [NSException raise:@"VVStackPopEmptyException" format:@"Can not pop an empty stack."];
    }
    
    double result = [self top];
    [self.numbers removeLastObject];
    return result;
}




















@end
