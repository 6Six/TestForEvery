//
//  NSString+Parser.h
//  CardioCycleBT
//
//  Created by richinfo on 15/5/30.
//  Copyright (c) 2015年 com.garry.test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Parser)

/**
 *  16进制字符串转换为NSData
 *
 *  @param resourceStr 16进制字符串
 *
 *  @return 转换后的NSData 对象
 */
- (NSData *)dataFromString;

/**
 *  十进制转十六进制
 *
 *  @return 十六进制字符串
 */
- (NSString *)toHexString;

@end
