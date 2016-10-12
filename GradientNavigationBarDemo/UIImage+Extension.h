//
//  UIImage+Extension.h
//  TestForEvery
//
//  Created by Garry on 2016/10/12.
//  Copyright © 2016年 richinfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

+ (UIImage *)imageResizableNamed:(NSString *)name;

+ (UIImage *)imageWatermarkNamed:(NSString *)watermarkName named:(NSString *)name scale:(CGFloat)scale;

+ (UIImage *)imageRoundNamed:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

+ (UIImage *)imageCaptureWithView:(UIView *)view;

+ (UIImage *)imageWithColor:(UIColor *)color;

- (UIColor *)pixelColorAtLocation:(CGPoint)point;


@end
