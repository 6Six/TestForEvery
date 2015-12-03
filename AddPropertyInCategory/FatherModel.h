//
//  FatherModel.h
//  TestForEvery
//
//  Created by Garry on 15/11/23.
//  Copyright © 2015年 richinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FatherModel : NSObject

- (void)loadSubView;

+ (void)invokeAllClassMethodWithSelector:(SEL)selector;

- (void)sayHello;

@end
