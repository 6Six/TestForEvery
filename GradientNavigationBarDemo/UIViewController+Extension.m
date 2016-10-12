//
//  UIViewController+Extension.m
//  TestForEvery
//
//  Created by Garry on 2016/10/12.
//  Copyright © 2016年 richinfo. All rights reserved.
//

#import "UIViewController+Extension.h"
#import "UIImage+Extension.h"
#import "UIView+Extension.h"

@implementation UIViewController (Extension)

- (void)navigationBarGradualChangeWithScrollView:(UIScrollView *)scrollView
                                       titleView:(UIView *)titleView
                                     movableView:(UIView *)movableView
                                          offset:(CGFloat)offset
                                           color:(UIColor *)color
{
    [self viewWillLayoutSubviews];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [self.navigationController.navigationBar setUserInteractionEnabled:scrollView.contentOffset.y > offset ? YES : NO];
    
    float alpha = 1 - ((offset - scrollView.contentOffset.y) / offset);
    [self setNavigationBarColor:color alpha:alpha];
    titleView.hidden = scrollView.contentOffset.y > offset ? NO : YES;
    movableView.hidden = !titleView.hidden;
}

- (void)setNavigationBarColor:(UIColor *)color alpha:(CGFloat)alpha
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[color colorWithAlphaComponent:alpha > 0.95f ? 0.95f : alpha]] forBarMetrics:UIBarMetricsDefault];
    
    if (self.navigationController.viewControllers.count > 1)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 64)];
        view.backgroundColor = color;
        [self.view addSubview:view];
    }
}

@end
