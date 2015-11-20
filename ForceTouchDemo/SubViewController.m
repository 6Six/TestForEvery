//
//  SubViewController.m
//  TestForEvery
//
//  Created by Garry on 15/11/2.
//  Copyright © 2015年 richinfo. All rights reserved.
//

#import "SubViewController.h"

@interface SubViewController ()

@end

@implementation SubViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissMe)];
    [self.view addGestureRecognizer:tap];
}

- (void)dismissMe
{
    // dismiss this view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    
    // setup a list of preview actions
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"这里可以做你想要做的事情的Aciton"
                                                          style:UIPreviewActionStyleDefault
                                                        handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController)
                                {
                                    NSLog(@"click");
                                }];
    
    // add them to an arrary
    //想要显示多个就定义多个 UIPreviewAction
    NSArray *actions = @[action1];
    
    // and return them (return the array of actions instead to see all items ungrouped)
    return actions;
}

@end
