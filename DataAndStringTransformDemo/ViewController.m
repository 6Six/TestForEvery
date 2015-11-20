//
//  ViewController.m
//  DataAndStringTransformDemo
//
//  Created by richinfo on 15/6/1.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Parser.h"
#import "NSData+Parser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *resourceStr = @"a55a000e0401e251200400010102";
    
    NSData *data = [resourceStr dataFromString];
    NSString *resultStr = [data stringFromData];
    
    NSLog(@"resultStr:%@", resultStr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}












@end
