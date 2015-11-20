//
//  ViewController.m
//  OCUserCDemo
//
//  Created by richinfo on 15/6/1.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "ViewController.h"

#ifdef __OBJC__

#include "CTest.h"

#endif

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Byte *bytes;
    NSInteger num = tl_generate_tl_header_crc8(bytes);
    NSLog(@"num");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
