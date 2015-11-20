//
//  TestViewController.m
//  TestForEvery
//
//  Created by Garry on 15/7/7.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "TestViewController.h"

NSString* const ordinalNumberSuffix(NSUInteger num) {
    if ((num / 10) % 10 == 1) {
        return @"th";       // Special cases 11th, 12th, 13th
    }
    switch (num % 10) {
        case 1:  return @"st";
        case 2:  return @"nd";
        case 3:  return @"rd";
        default: return @"th";
    }
}

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [UIView animateWithDuration:0.03
                          delay: 0.0
                        options: UIViewAnimationOptionCurveEaseIn |
     UIViewAnimationOptionBeginFromCurrentState
                     animations:showFlashView
                     completion:firstCompletionBlock];
    
}

void (^ showFlashView)(void) = ^{
//    flashView.alpha = 1.0f;
};

void (^ hideFlashView)(void) = ^{
//    flashView.alpha = 0.0f;
};

void (^ lastCompletionBlock)(bool) = ^(BOOL finished) {
    //    [flashView removeFromSuperview];
    //    [self performSelector:callback];
};

void (^ firstCompletionBlock)(bool) = ^(BOOL finished) {
//    CGSize s = [[CCDirector sharedDirector] winSize];
//    UIImage *img2 =[self screenhot];

//    UIGraphicsBeginImageContext(s);
//    [img2 drawInRect:CGRectMake(0,0,s.width,s.height)];
//    [transitView.layer renderInContext:UIGraphicsGetCurrentContext()];

//    self.snapshoot = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    [self showMenu];
    
    [UIView animateWithDuration:0.5
                          delay: 0.0
                        options: UIViewAnimationOptionCurveEaseIn |
     UIViewAnimationOptionBeginFromCurrentState
                     animations:hideFlashView
                     completion:lastCompletionBlock];
};



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
