//
//  SlideAnimation.m
//  TestForEvery
//
//  Created by Garry on 15/9/11.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "SlideAnimation.h"

@implementation SlideAnimation

#pragma mark - Animated Transitioning
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // Get references to the view hierarchy
    UIView *containerView = [transitionContext containerView];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // Insert 'to' view into the hierarchy
    [containerView insertSubview:toViewController.view aboveSubview:fromViewController.view];
    
    // 90 degree transform away from the user
    CATransform3D t = CATransform3DIdentity;
    t = CATransform3DRotate(t, M_PI / 2.0, 0.0, 1.0, 0.0);
    t.m34 = 1.0 / -2000;
    
    // Set anchor points for the views
    if (self.animationType == AnimationTypePresent)
    {
        [self setAnchorPoint:CGPointMake(1.0, 0.5) forView:toViewController.view];
        [self setAnchorPoint:CGPointMake(0.0, 0.5) forView:fromViewController.view];
    }
    else if (self.animationType == AnimationTypeDismiss)
    {
        [self setAnchorPoint:CGPointMake(0.0, 0.5) forView:toViewController.view];
        [self setAnchorPoint:CGPointMake(1.0, 0.5) forView:fromViewController.view];
    }
    
    // Set appropriate z indexes
    fromViewController.view.layer.zPosition = 2.0;
    toViewController.view.layer.zPosition = 1.0;
    
    // Apply full transform to the 'to' view to start out with
    toViewController.view.layer.transform = t;
    
    // Animate the transition, applying transform to 'from' view and removing it from 'to' view
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromViewController.view.layer.transform = t;
        toViewController.view.layer.transform = CATransform3DIdentity;
    } completion:^(BOOL finished) {
        // Reset z indexes (otherwise this will affect other transitions)
        fromViewController.view.layer.zPosition = 0.0;
        toViewController.view.layer.zPosition = 0.0;
        
        [transitionContext completeTransition:YES];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

#pragma mark - Private methods
- (void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view
{
    CGPoint oldOrigin = view.frame.origin;
    view.layer.anchorPoint = anchorPoint;
    CGPoint newOrigin = view.frame.origin;
    
    CGPoint transition;
    transition.x = newOrigin.x - oldOrigin.x;
    transition.y = newOrigin.y - oldOrigin.y;
    
    view.center = CGPointMake(view.center.x - transition.x, view.center.y - transition.y);
}


















@end
