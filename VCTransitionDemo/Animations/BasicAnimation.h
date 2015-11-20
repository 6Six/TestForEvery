//
//  BasicAnimation.h
//  TestForEvery
//
//  Created by Garry on 15/9/11.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, AnimationType) {
    AnimationTypePresent = 0,
    AnimationTypeDismiss
};

@interface BasicAnimation : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) AnimationType animationType;

@end
