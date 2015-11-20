//
//  Book.m
//  TestForEvery
//
//  Created by Garry on 15/7/4.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "Book.h"

@implementation Book

#pragma mark - NSCoding
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (!self)
    {
        return nil;
    }
    
    self.title = [aDecoder decodeObjectForKey:@"title"];
    self.author = [aDecoder decodeObjectForKey:@"author"];
    self.pageCount = [aDecoder decodeIntegerForKey:@"pageCount"];
    self.categories = [aDecoder decodeObjectForKey:@"categories"];
    self.available = [aDecoder decodeBoolForKey:@"available"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.author forKey:@"author"];
    [aCoder encodeInteger:self.pageCount forKey:@"pageCount"];
    [aCoder encodeObject:self.categories forKey:@"categories"];
    [aCoder encodeBool:self.available forKey:@"available"];
}

@end
