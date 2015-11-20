//
//  ViewController.m
//  NSUrlConnectionDemo
//
//  Created by Garry on 15/8/13.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self testUrl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void)testUrl
{
    NSString *urlStr = [NSString stringWithFormat:@"http://www.cnblogs.com/wendingding/p/3813572.html"];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSLog(@"data:%@", data);
}



@end



































