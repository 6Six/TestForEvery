//
//  FirstSubViewController.m
//  TestForEvery
//
//  Created by Garry on 15/6/11.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "FirstSubViewController.h"

@interface FirstSubViewController ()

@end

@implementation FirstSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    textLabel.text = _text;
    [self.view addSubview:textLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
