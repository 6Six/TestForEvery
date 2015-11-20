//
//  TestInfo.m
//  TestForEvery
//
//  Created by Garry on 15/6/8.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "TestInfo.h"

@implementation TestInfo

- (instancetype)initWithName:(NSString *)name selected:(BOOL)isSelected
{
    if (self = [super init])
    {
        self.name = name;
        self.isSelect = isSelected;
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeBool:self.isSelect forKey:@"selected"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.isSelect = [aDecoder decodeBoolForKey:@"selected"];
    
    return self;
}

@end
