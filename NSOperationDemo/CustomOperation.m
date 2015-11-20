//
//  CustomOperation.m
//  TestForEvery
//
//  Created by Garry on 15/9/20.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "CustomOperation.h"

@interface CustomOperation ()

@property (nonatomic, strong) NSOperationQueue *uploadQueue;

@end

@implementation CustomOperation
@synthesize executing = _executing;
@synthesize finished = _finished;

#pragma mark - 内存管理
- (void)dealloc
{
    self.uploadQueue = nil;
}

#pragma mark 初始化方法
- (instancetype)init
{
    if (self = [super init])
    {
        _uploadQueue = [NSOperationQueue new];
        [_uploadQueue setMaxConcurrentOperationCount:1];
    }
    
    return self;
}

- (BOOL)isConcurrent
{
    return NO;
}

- (BOOL)isExecuting
{
    return _executing;
}

- (BOOL)isFinished
{
    return _finished;
}


#pragma mark - 重写NSOperation方法
- (void)start
{
    if (self.isCancelled)
    {
        [self willChangeValueForKey:@"isFinished"];
        _finished = YES;
        [self didChangeValueForKey:@"isFinished"];
        
        return;
    }
    
    [self willChangeValueForKey:@"isExecuting"];
    
    [NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
    _executing = YES;
    
    [self didChangeValueForKey:@"isExecuting"];

}


- (void)main
{
    // 在异步线程调用就不能够访问主线程的自动释放池
    // 因此在这里新建一个属于当前线程的自动释放池
    @autoreleasepool
    {
        @synchronized(self)
        {
            if ([self isCancelled])
            {
                // 执行耗时操作之后都需要判断是否取消
                [self cancel];
            }
            else
            {
//                for (NSBlockOperation *operation in [self.uploadQueue operations])
//                {
//                    [operation start];
//                }

                
//                [self willChangeValueForKey:@"isExecuting"];
//                _executing = NO;
//                [self didChangeValueForKey:@"isExecuting"];
//                
//                [self willChangeValueForKey:@"isFinished"];
//                _finished  = YES;
//                [self didChangeValueForKey:@"isFinished"];
            }
        }
    }
}

#pragma mark - 公开方法
- (void)addOperation:(NSBlockOperation *)operation
{
    [self.uploadQueue addOperation:operation];
}

@end
