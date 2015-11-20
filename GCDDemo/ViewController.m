//
//  ViewController.m
//  GCDDemo
//
//  Created by Garry on 15/7/6.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "ViewController.h"

typedef float (^MyBlockType)(float, float);

@interface ViewController ()

@property (nonatomic, assign) NSInteger var;
@property (nonatomic, strong) dispatch_queue_t serialQueue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.serialQueue = dispatch_queue_create("Serial Queue", NULL);
    self.var = 10;
    
    [self task1];
    [self task2];
    
    _var = 30;
    NSLog(@"task3:%ld", (long)_var);
    
}

- (void)task1
{
    dispatch_async(_serialQueue, ^{
        [NSThread sleepForTimeInterval:1];
        
        NSLog(@"task:%ld", (long)_var);
        
        [NSThread sleepForTimeInterval:5];
        
        _var = 20;
    });
}

- (void)task2
{
    dispatch_async(_serialQueue, ^{
        NSLog(@"task2:%ld", (long)_var);
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
