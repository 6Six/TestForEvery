//
//  ViewController.m
//  NSURLSessionDemo
//
//  Created by Garry on 15/10/29.
//  Copyright © 2015年 richinfo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<nsse

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createUrlSession
{
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"com.garry.urlSession"]];
    NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"com.garry.urlSession"] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
//    NSURLSessionDownloadTask *task = [[NSURLSessionDownloadTask alloc] init];
//    task.originalRequest = [NSURLRequest requestWithURL:session.]
    
}

- (void)url



























@end
