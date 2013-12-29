//
//  YoukeywordTests.m
//  YoukeywordTests
//
//  Created by apium on 28/12/13.
//  Copyright (c) 2013 apium. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <RestKit/RKObjectManager.h>
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

- (void)test_YoukeywordService_isNotNil
{
    XCTAssertNotNil(self.sut, @"should not be null");
}

- (void)test_getResponseFromServer
{
    NSString *actual = [self.sut responseFromServer];
    NSString *espected = @"weke";
    XCTAssertEqual(actual,espected,@"should return valid json");
}

- (void)test_objectManager_baseURLIsCorrect
{
    RKObjectManager *objectManager = [self.sut objectManager];
    NSURL *actual = [[objectManager baseURL] baseURL];
    NSString *expected = @"http://54.213.142.98:8080/PLNEngine/service";
    NSString *formattedActual = [NSString stringWithFormat:@"%@", actual];
    XCTAssertTrue([formattedActual isEqualToString:expected],@"String are not equals %@ %@",formattedActual,expected);
}

- (void)test_getQueryParams_paramW_wellPopulated
{
    NSString *const text = @"hola";
    NSString *const language = @"en";
    NSString *const name = @"name";
    NSString *const userId = @"userid";
    NSDictionary *actual = [self.sut getQueryParams:text language:language name:name userId:userId];
    NSString *formattedActual = [actual objectForKey: @"w"];
    NSString *expected = @"hola";
    XCTAssertTrue([expected isEqualToString:formattedActual],@"String are not equals %@ %@",formattedActual,expected);
}


@end
