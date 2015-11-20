//
//  TestInfo.h
//  TestForEvery
//
//  Created by Garry on 15/6/8.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestInfo : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) BOOL isSelect;

- (instancetype)initWithName:(NSString *)name selected:(BOOL)isSelected;

@end
