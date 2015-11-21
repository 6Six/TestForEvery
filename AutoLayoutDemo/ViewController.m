//
//  ViewController.m
//  AutoLayoutDemo
//
//  Created by Garry on 15/11/20.
//  Copyright © 2015年 richinfo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) CGFloat middleViewTopSpaceLayoutConstant;
@property (nonatomic, assign) CGFloat middleViewOriginY;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.panGesture addTarget:self action:@selector(pan:)];
    self.middleViewTopSpaceLayoutConstant = self.middleViewTopSpaceLayout.constant;
    self.middleViewOriginY = self.middleView.frame.origin.y;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pan:(UIPanGestureRecognizer *)recog
{
    if (recog.state == UIGestureRecognizerStateEnded)
    {
        [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGRect frame = self.middleView.frame;
            frame.origin.y = self.middleViewOriginY;
            self.middleView.frame = frame;
        } completion:^(BOOL finished) {
            if (finished)
            {
                self.middleViewTopSpaceLayout.constant = self.middleViewTopSpaceLayoutConstant;
            }
        }];
        
        return;
    }
    else if (recog.state == UIGestureRecognizerStateChanged)
    {

    }
    
    CGFloat y = [recog translationInView:self.view].y;
    self.middleViewTopSpaceLayout.constant = self.middleViewTopSpaceLayoutConstant + y;
}















@end
