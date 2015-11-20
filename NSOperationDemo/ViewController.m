//
//  ViewController.m
//  NSOperationDemo
//
//  Created by Garry on 15/9/20.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "ViewController.h"
#import "CustomOperation.h"

@interface ViewController ()
//<UITableViewDataSource,
//UITableViewDelegate>
//
//@property (nonatomic, strong) UITableView *tableView;
//
//@property (nonatomic, copy) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

//    [self executeOperationUsingOperationQueue];
    
    [self testCustomOperation];
}

- (void)testCustomOperation
{
//    CustomOperation *operation = [[CustomOperation alloc] init];
    
    //    for (NSInteger index = 0; index < 3; index++)
    //    {
    //        NSBlockOperation *blockOpe = [[NSBlockOperation alloc] init];
    //
    //        [blockOpe addExecutionBlock:^{
    //            NSLog(@"index:%@", @(index));
    //        }];
    //
    //        [operation addOperation:blockOpe];
    //    }
    //
    NSBlockOperation *blockOpe1 = [[NSBlockOperation alloc] init];
    [blockOpe1 addExecutionBlock:^{
        sleep(3);
        NSLog(@"index:%@", @(1));
    }];
    //
//    NSBlockOperation *blockOpe2 = [[NSBlockOperation alloc] init];
    [blockOpe1 addExecutionBlock:^{
        
        sleep(2);
        
        NSLog(@"index:%@", @(5));
    }];
    //
    
    //    [blockOpe1 addDependency:blockOpe2];
    
//    NSBlockOperation *blockOpe3 = [[NSBlockOperation alloc] init];
    [blockOpe1 addExecutionBlock:^{
        sleep(1);
        NSLog(@"index:%@", @(2));
    }];
    
    [blockOpe1 start];
    
    // NSOperationQueue会自动执行里面的operation，不用手动启动
    // 添加依赖关系的operation必须要添加到queue中，但是无关添加到哪个queue里；添加依赖关系必须要在加入到queue里之前；不能直接在operation间添加依赖关系，会导致两个operation都不执行
//    [blockOpe3 addDependency:blockOpe1];
//    [blockOpe1 addDependency:blockOpe2];
    
//    [operation addOperation:blockOpe1];
//    [operation addOperation:blockOpe2];
//    [operation addOperation:blockOpe3];
//    
//    
//    [operation start];
}

- (void)executeOperationUsingOperationQueue {
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    
    NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(taskMethod) object:nil];
    [operationQueue addOperation:invocationOperation];
    
    NSBlockOperation *blockOperation1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"Start executing blockOperation1, mainThread: %@, currentThread: %@", [NSThread mainThread], [NSThread currentThread]);
        sleep(3);
        NSLog(@"Finish executing blockOperation1");
    }];
    
    NSBlockOperation *blockOperation2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"Start executing blockOperation2, mainThread: %@, currentThread: %@", [NSThread mainThread], [NSThread currentThread]);
        sleep(3);
        NSLog(@"Finish executing blockOperation2");
    }];
    
    [operationQueue addOperations:@[ blockOperation1, blockOperation2 ] waitUntilFinished:NO];
    
    [operationQueue addOperationWithBlock:^{
        NSLog(@"Start executing block, mainThread: %@, currentThread: %@", [NSThread mainThread], [NSThread currentThread]);
        sleep(3);
        NSLog(@"Finish executing block");
    }];
    
    [operationQueue waitUntilAllOperationsAreFinished];
}

- (void)taskMethod {
    NSLog(@"Start executing %@, mainThread: %@, currentThread: %@", NSStringFromSelector(_cmd), [NSThread mainThread], [NSThread currentThread]);
    sleep(3);
    NSLog(@"Finish executing %@", NSStringFromSelector(_cmd));
}


@end
