//
//  MyFirstTests.m
//  MyFirstTests
//
//  Created by xavi on 06/03/14.
//  Copyright (c) 2014 xavi. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface MyFirstTests : XCTestCase

@end

@implementation MyFirstTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMyfirstTest
{
    NSString *actual = @"asdfg";
    XCTAssertEqual(actual, @"should not be null");
}

@end
