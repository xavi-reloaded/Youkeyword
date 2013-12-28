//
//  YoukeywordTests.m
//  YoukeywordTests
//
//  Created by apium on 28/12/13.
//  Copyright (c) 2013 apium. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DTRequestVerifier.h"

@interface YoukeywordTests : XCTestCase

@end

@implementation YoukeywordTests

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

- (void)testConnectionToServiceInAmazonWorks
{
    NSDictionary * parameters = @{@"id":@"test", @"w":@"hello post", @"l":@"en", @"name":@"xavi"};
    NSURL * url = [NSURL URLWithString:@"http://54.213.142.98:8080/PLNEngine/service"];
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[NSJSONSerialization dataWithJSONObject:parameters
                                                         options:0
                                                           error:nil]];

    DTRequestVerifier * verifier = [DTRequestVerifier verifier];
    verifier.host = @"54.213.142.98";
    verifier.path = @"/PLNEngine/service";
    verifier.HTTPMethod = @"POST";
    verifier.bodyParams = parameters;

    XCTAssert([verifier verifyRequest:request]);
}

@end
