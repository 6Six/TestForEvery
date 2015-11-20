//
//  ViewController.m
//  AutoreleaseDemo
//
//  Created by richinfo on 15/6/1.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

__weak NSString *string_weak_ = nil;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    // 场景1
//    NSString *string = [NSString stringWithFormat:@"test"];
//    string_weak_ = string;
    
//    // 场景2
//    @autoreleasepool {
//        NSString *string = [NSString stringWithFormat:@"test"];
//        string_weak_ = string;
//    }
    
    // 场景3
    NSString *string = nil;
    @autoreleasepool {
        string = [NSString stringWithFormat:@"test"];
        string_weak_ = string;
    }
    
    NSLog(@"string:%@", string_weak_);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"string:%@", string_weak_);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSLog(@"string:%@", string_weak_);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





















@end
