//
//  ViewController.h
//  AutoLayoutDemo
//
//  Created by Garry on 15/11/20.
//  Copyright © 2015年 richinfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIView *middleView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *middleViewTopSpaceLayout;
@property (nonatomic, weak) IBOutlet UIPanGestureRecognizer *panGesture;

@end

