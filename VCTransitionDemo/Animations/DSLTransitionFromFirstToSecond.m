//
//  DSLTransitionFromFirstToSecond.m
//  TestForEvery
//
//  Created by Garry on 15/9/25.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "DSLTransitionFromFirstToSecond.h"
#import "DSLFirstViewController.h"
#import "DSLSecondViewController.h"

@implementation DSLTransitionFromFirstToSecond

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    DSLFirstViewController *fromViewController = (DSLFirstViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    DSLSecondViewController *toViewController = (DSLSecondViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    UITableViewCell *cell = (UITableViewCell *)[fromViewController.tableView cellForRowAtIndexPath:[[fromViewController.tableView indexPathsForSelectedRows] firstObject]];
    UIView *cellImageSnapshot = [cell.imageView snapshotViewAfterScreenUpdates:NO];
    cellImageSnapshot.frame = [containerView convertRect:cell.imageView.frame fromView:cell.imageView.superview];
    cell.imageView.hidden = YES;
    
    // Setup the initial view states
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.alpha = 0;
    toViewController.imageView.hidden = YES;
    
    [containerView addSubview:toViewController.view];
    [containerView addSubview:cellImageSnapshot];
    
    
    [UIView animateWithDuration:0.5 animations:^{
        // Fade in the second view controller's view
        toViewController.view.alpha = 1.0;
        
        // Move the cell snapshot so it's over the second view controller's image view
        CGRect frame = [containerView convertRect:toViewController.imageView.frame fromView:toViewController.view];
        cellImageSnapshot.frame = frame;
    } completion:^(BOOL finished) {
        // Clean up
        toViewController.imageView.hidden = NO;
        cell.hidden = NO;
        [cellImageSnapshot removeFromSuperview];
        
        // Declare that we've finished
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}













@end
