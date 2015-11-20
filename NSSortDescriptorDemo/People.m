//
//  People.m
//  TestForEvery
//
//  Created by Garry on 15/7/4.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "People.h"

@implementation People

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@ %@", _firstName, _lastName, _age];
}

@end
