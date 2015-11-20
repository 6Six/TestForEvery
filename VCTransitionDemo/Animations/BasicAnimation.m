//
//  BasicAnimation.m
//  TestForEvery
//
//  Created by Garry on 15/9/11.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "BasicAnimation.h"

@implementation BasicAnimation

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    NSAssert(NO, @"animateTransition: should be handled by subclass of BasicAnimation");
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0;
}

- (void)handlePinch:(UIPinchGestureRecognizer *)pinch
{
    NSAssert(NO, @"handlePinch: should be handled by a subclass of BasicAnimation");
}

@end
