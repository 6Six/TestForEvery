//
//  VVStack.h
//  TestForEvery
//
//  Created by Garry on 15/7/29.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VVStack : NSObject

- (void)push:(double)num;

- (double)top;

- (NSInteger)count;

- (double)pop;

@end
