//
//  DSLFirstViewController.m
//  TestForEvery
//
//  Created by Garry on 15/9/25.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "DSLFirstViewController.h"
#import "DSLSecondViewController.h"
#import "DSLTransitionFromFirstToSecond.h"

@interface DSLFirstViewController ()

@end

@implementation DSLFirstViewController

#pragma mark - Life circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.navigationController.delegate = self;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    if (self.navigationController.delegate == self)
    {
        self.navigationController.delegate = nil;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}


#pragma mark - UINavigationController delegate methods
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    // Check if we're transitioning from this view controller to a DSLSecondViewController
    if (fromVC == self && [toVC isKindOfClass:[DSLSecondViewController class]])
    {
        return [[DSLTransitionFromFirstToSecond alloc] init];
    }
    else
    {
        return nil;
    }
}




















@end
