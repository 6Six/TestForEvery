//
//  SonModel.h
//  TestForEvery
//
//  Created by Garry on 15/11/23.
//  Copyright © 2015年 richinfo. All rights reserved.
//

#import "FatherModel.h"

@interface SonModel : NSObject

- (void)sayHello;

- (void)loadSubView;

- (void)invokeAllClassMethodWithSelector:(SEL)selector;

@end
