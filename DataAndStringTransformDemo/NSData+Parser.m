//
//  NSData+Parser.m
//  TestForEvery
//
//  Created by richinfo on 15/6/1.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "NSData+Parser.h"

@implementation NSData (Parser)

- (NSString *)stringFromData
{
    Byte *bytes = (Byte *)[self bytes];
    
    NSMutableString *tempString = [NSMutableString string];
    for (NSInteger index = 0, length = self.length; index < length; index++)
    {
        NSInteger hexInt = bytes[index] & 0xff;
        NSString *temByteStr = [NSString stringWithFormat:@"%02lx", (long)hexInt];
        
        [tempString appendString:temByteStr];
    }
    
    return [tempString copy];
}

@end
