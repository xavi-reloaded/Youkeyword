//
//  YoukeywordTests.m
//  YoukeywordTests
//
//  Created by apium on 28/12/13.
//  Copyright (c) 2013 apium. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DTRequestVerifier.h"
#import "FormadisimoService.h"

@interface FormadisimoServiceTest : XCTestCase

@property(nonatomic, strong) FormadisimoService *sut;
@end

@implementation FormadisimoServiceTest

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

- (void)test_getBaseURL_nothing_validFormadisimoURL
{
    self.sut = [[FormadisimoService alloc] initWithCustomURL:@"http://www.formadisimo.com"];

    NSString *actual = [self.sut getBaseURL];
    NSString *expected = @"http://www.formadisimo.com/ws/";

    XCTAssertTrue([actual isEqualToString:expected],@"String are not equals %@ %@",actual,expected);
}

@end
