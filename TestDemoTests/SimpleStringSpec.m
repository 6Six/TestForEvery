//
//  SimpleStringSpec.m
//  TestForEvery
//
//  Created by Garry on 15/7/29.
//  Copyright 2015年 richinfo. All rights reserved.
//

#import <Kiwi/Kiwi.h>
//#import "SimpleString.h"
#import "VVStack.h"


SPEC_BEGIN(SimpleStringSpec)

describe(@"SimpleString", ^{
    context(@"when assigned to 'Hello world'", ^{
        VVStack *stack = [[VVStack alloc] init];
        NSString *greeting = @"Hello world";
        
        it(@"should exist", ^{
            [[greeting shouldNot] beNil];
        });
        
        it(@"should equal to 'Hello world'", ^{
            [[greeting should] equal:@"Hello world"];
        });
        
        it(@"should equal contains 0 elements", ^{
            [[theValue([stack count]) should] beZero];
        });

        it(@"should equal contains 0 elment", ^{
            [[stack should] haveCountOf:0];
        });
    });
    
    context(@"when new created and pushed 4.6", ^{
        __block VVStack *stack = nil;
        beforeEach(^{
            stack = [VVStack new];
            [stack push:4.6];
        });
        
        afterEach(^{
            stack = nil;
        });
        
        it(@"can be poped and the value equals 4.6", ^{
            [[theValue([stack pop]) should] equal:theValue(4.6)];
        });
        
        it(@"should contains 0 element after pop", ^{
            [stack pop];
            [[stack should] beEmpty];
        });
        
        it(@"should raise a exception when pop", ^{
            [[theBlock(^{
                [stack pop];
            }) should] raiseWithName:@"VVStackPopEmptyException"];
        });
    });
});




















SPEC_END
