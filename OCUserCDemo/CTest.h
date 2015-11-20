//
//  CTest.h
//  TestForEvery
//
//  Created by richinfo on 15/6/1.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#ifndef __TestForEvery__CTest__
#define __TestForEvery__CTest__

#include <stdio.h>

#endif /* defined(__TestForEvery__CTest__) */


/**
 *  校验TLHeader
 *
 *  @param p_data TLHeader data
 *
 *  @return crc8校验值
 */
uint8_t tl_generate_tl_header_crc8(uint8_t * p_data);

/**
 *  校验TLPayload
 *
 *  @param p_data TLPayload data
 *
 *  @return crc16校验值
 *
 */
uint16_t tl_generate_tl_payload_crc16(uint8_t * p_data, uint8_t length);