//
//  YoukeywordTests.m
//  YoukeywordTests
//
//  Created by apium on 28/12/13.
//  Copyright (c) 2013 apium. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DTRequestVerifier.h"
#import "YoukeywordService.h"

@interface YoukeywordServiceTests : XCTestCase

@property (nonatomic, strong) YoukeywordService *sut;

@end

@implementation YoukeywordServiceTests

- (void)setUp
{
    [super setUp];
    self.sut = [[YoukeywordService alloc] init];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_YoukeywordService_isNotNull
{
    XCTAssertNotNil(self.sut, @"should not be null");
}


- (void)test_getResponseFromServer
{
    NSString *actual = [self.sut responseFromServer];
    NSString *espected = @"weke";
    XCTAssertEqual(actual,espected,@"should return valid json");
}

@end
