//
//  CustomOperation.h
//  TestForEvery
//
//  Created by Garry on 15/9/20.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomOperation : NSOperation

- (void)addOperation:(NSBlockOperation *)operation;


@end
