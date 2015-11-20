//
//  TestDemoTests.m
//  TestDemoTests
//
//  Created by Garry on 15/7/29.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "VVStack.h"

@interface TestDemoTests : XCTestCase

@end

@implementation TestDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testStackExist
{
    XCTAssertNotNil([VVStack class], @"VVStack class should exist");
}

- (void)testStackObjectCanBeCreated
{
    VVStack *stack = [VVStack new];
    XCTAssertNotNil(stack, @"VVStack object can be created");
}

- (void)testPushANumberAndGetIt
{
    VVStack *stack = [VVStack new];
    [stack push:2.3];
    double topNumber = [stack top];
    XCTAssertEqual(topNumber, 2.3, @"VVStack should can be pushed and has that top value");
}

- (void)testAtho
{
    for (NSInteger index = 0; index < 99; index++)
    {
        NSInteger num = (index / 4) * 10 + ((index % 4) + 1) * 2 + (index % 4) / 2;
        NSLog(@"num:%ld\n", (long)num);
    }
}

@end
