//
//  Book.h
//  TestForEvery
//
//  Created by Garry on 15/7/4.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject<NSCoding>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *author;

@property (nonatomic, strong) NSSet *categories;

@property (nonatomic, assign) NSUInteger pageCount;

@property (nonatomic, assign, getter=isAvailable) BOOL available;

@end
