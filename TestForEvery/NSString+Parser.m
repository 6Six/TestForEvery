//
//  NSString+Parser.m
//  TestForEvery
//
//  Created by richinfo on 15/5/30.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "NSString+Parser.h"

@implementation NSString (Parser)

+ (NSData *)dataFromString:(NSString *)resourceStr
{
    //    NSString *hexString = @"3e435fab9c34891f"; //16进制字符串
    NSInteger length = resourceStr.length;
    int j=0;
    Byte bytes[length];  ///3ds key的Byte 数组， 128位
    for(int i=0; i < length; i++)
    {
        int int_ch;  /// 两位16进制数转化后的10进制数
        
        unichar hex_char1 = [resourceStr characterAtIndex:i]; ////两位16进制数中的第一位(高位*16)
        int int_ch1;
        if(hex_char1 >= '0' && hex_char1 <='9')
        {
            int_ch1 = (hex_char1-48)*16;   //// 0 的Ascll - 48
        }
        else if(hex_char1 >= 'A' && hex_char1 <='F')
        {
            int_ch1 = (hex_char1-55)*16; //// A 的Ascll - 65
        }
        else
        {
            int_ch1 = (hex_char1-87)*16; //// a 的Ascll - 97
        }
        
        i++;
        
        unichar hex_char2 = [resourceStr characterAtIndex:i]; ///两位16进制数中的第二位(低位)
        int int_ch2;
        if(hex_char2 >= '0' && hex_char2 <='9')
        {
            int_ch2 = (hex_char2-48); //// 0 的Ascll - 48
        }
        else if(hex_char1 >= 'A' && hex_char1 <='F')
        {
            int_ch2 = hex_char2-55; //// A 的Ascll - 65
        }
        else
        {
            int_ch2 = hex_char2-87; //// a 的Ascll - 97
        }
        
        int_ch = int_ch1+int_ch2;
        NSLog(@"int_ch=%d",int_ch);
        bytes[j] = int_ch;  ///将转化后的数放入Byte数组里
        j++;
    }
    NSData *newData = [[NSData alloc] initWithBytes:bytes length:length / 2];
    NSLog(@"newData=%@",newData);
    
    return newData;
}

@end
