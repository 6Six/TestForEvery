//
//  ScaleAnimation.h
//  TestForEvery
//
//  Created by Garry on 15/9/11.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "BasicAnimation.h"

@interface ScaleAnimation : BasicAnimation
<UIViewControllerInteractiveTransitioning>

@property (nonatomic, strong) UIView *viewForInteraction;
@property (nonatomic, assign) UINavigationController *navigationController;
@property (nonatomic, assign, getter = isInteractive) BOOL interactive;

- (instancetype)initWithNavigationController:(UINavigationController *)controller;
- (void)handlePinch:(UIPinchGestureRecognizer *)pinch;

@end
