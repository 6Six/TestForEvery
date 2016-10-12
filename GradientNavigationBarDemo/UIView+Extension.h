//
//  UIView+Extension.h
//  TestForEvery
//
//  Created by Garry on 2016/10/12.
//  Copyright © 2016年 richinfo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SSWhenTappedBlock)();

@interface UIView (Extension)
<UIGestureRecognizerDelegate>

- (CGFloat)xMax;

- (CGFloat)xMiddle;

- (CGFloat)x;

- (CGFloat)yMax;

- (CGFloat)yMiddle;

- (CGFloat)y;

- (CGFloat)width;

- (CGFloat)height;

- (void)removeAllSubviews;

- (void)whenTapped:(SSWhenTappedBlock)block;

- (void)whenDoubleTapped:(SSWhenTappedBlock)block;

- (void)whenTwoFingerTapped:(SSWhenTappedBlock)block;

- (void)whenTouchedDown:(SSWhenTappedBlock)block;

- (void)whenTouchedUp:(SSWhenTappedBlock)block;

- (void)loomingAnimationWithDuration:(CGFloat)duration;


@end
