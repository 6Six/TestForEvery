//
//  DeviceInfoViewController.m
//  TestForEvery
//
//  Created by Garry on 15/7/9.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "DeviceInfoViewController.h"

@interface DeviceInfoViewController ()

@end

@implementation DeviceInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 150, 40)];
    label.text = @"3";
    [self.view addSubview:label];
    
    UIButton *barButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [barButton setFrame:CGRectMake(0, 0, 40, 40)];
    [barButton setTitle:@"Set" forState:UIControlStateNormal];
    [barButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [barButton addTarget:self action:@selector(barButtonClickAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:barButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)barButtonClickAction:(id)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        [[self parentViewController].view setFrame:CGRectMake(150, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    }];
}

@end
