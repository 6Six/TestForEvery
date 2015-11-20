//
//  ViewController.m
//  ZipArchiveDemo
//
//  Created by Garry on 15/10/30.
//  Copyright © 2015年 richinfo. All rights reserved.
//

#import "ViewController.h"

#import "SSZipArchive.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Create
//    [SSZipArchive createZipFileAtPath:@"" withContentsOfDirectory:@""];
    
    // Unzip
    NSString *filePath = [self getDocument];
    NSString *fileName = @"test.zip";
    
    BOOL success =[SSZipArchive unzipFileAtPath:[filePath stringByAppendingPathComponent:fileName] toDestination:filePath];
    NSLog(@"zip archive:%@", @(success));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)getDocument
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

@end
