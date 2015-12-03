//
//  Model+Property.h
//  TestForEvery
//
//  Created by Garry on 15/11/25.
//  Copyright © 2015年 richinfo. All rights reserved.
//

#import "Model.h"

@interface Model (Property)

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSDate *date;

+ (void)categoryInitialize;

+ (void)invokeAllClassMethodWithSelector:(SEL)selector;

@end
