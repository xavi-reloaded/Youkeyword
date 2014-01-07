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
#import "DummyDelegateClass.h"

@interface YoukeywordServiceTests : XCTestCase

@property (nonatomic, strong) YoukeywordService *sut;

@property(nonatomic, strong) DummyDelegateClass *dummyDelegateClass;
@end

@implementation YoukeywordServiceTests

- (void)setUp
{
    [super setUp];
    self.dummyDelegateClass = [[DummyDelegateClass alloc] init];
    self.sut = [[YoukeywordService alloc] init:self.dummyDelegateClass];
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

- (void)test_YoukeywordService_withNullConstructor
{
    self.sut = [[YoukeywordService alloc] init];
    XCTAssertNotNil(self.sut, @"should not be null");
}



- (void)test_getResponseFromServer_anemycTest_and_I_know_it
{
    NSString *text = @"Luís Alves de Lima e Silva";
    NSString *language = @"en";
    NSString *name = @"name";
    NSString *userId = @"userId";

    NSDictionary *queryParams = [self.sut getQueryParams:text language:language name:name userId:userId];
    [self.sut loadYoukeywordObjectsArResourcePath:queryParams];
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

- (void)test_configureMappingForObjectManager
{
    RKObjectManager *actual = [self.sut configureMappingForObjectManager:self.sut.objectManager];
    XCTAssertNotNil(actual,@"mapping is not working %@",actual);
}

- (void)test_integrationTest
{
    YoukeywordService *service = [[YoukeywordService alloc] init:[self dummyDelegateClass]];
    [service loadYoukeywordObjectsFromText:@"this is a test with MIT"];
}


@end

/*


    RKURL *baseURL = [RKURL URLWithBaseURLString:@"http://54.213.142.98:8080/PLNEngine/service"];
    RKObjectManager *objectManager = [RKObjectManager objectManagerWithBaseURL:baseURL];
    objectManager.client.baseURL = baseURL;


    RKObjectMapping *keywordMapping = [RKObjectMapping mappingForClass:[Keywords class]];
    [keywordMapping mapKeyPathsToAttributes:@"lemma", @"lemma", @"namedEntity", @"namedEntity", nil];
    [objectManager.mappingProvider setMapping:keywordMapping forKeyPath:@""];

//    RKObjectMapping *feedMapping = [RKObjectMapping mappingForClass:[SIFeed class]];
//    [feedMapping mapKeyPathsToAttributes:@"feeds", nil];
//    [keywordMapping mapRelationship:@"feeds" withMapping:feedMapping];
//    [objectManager.mappingProvider setMapping:feedMapping forKeyPath:@"feeds"];
//
//    RKObjectMapping *venueMapping = [RKObjectMapping mappingForClass:[Venue class]];
//    [venueMapping mapKeyPathsToAttributes:@"id", @"venueID", @"name", @"name", nil];
//    [objectManager.mappingProvider setMapping:venueMapping forKeyPath:@"response.venues"];
//
//    RKObjectMapping *locationMapping = [RKObjectMapping mappingForClass:[Location class]];
//    [locationMapping mapKeyPathsToAttributes:@"address", @"address", @"city", @"city", @"country", @"country", @"crossStreet", @"crossStreet", @"postalCode", @"postalCode", @"state", @"state", @"distance", @"distance", @"lat", @"lat", @"lng", @"lng", nil];
//
//    [venueMapping mapRelationship:@"location" withMapping:locationMapping];
//    [objectManager.mappingProvider setMapping:locationMapping forKeyPath:@"location"];
//
//    RKObjectMapping *statsMapping = [RKObjectMapping mappingForClass:[Stats class]];
//    [statsMapping mapKeyPathsToAttributes:@"checkinsCount", @"checkins", @"tipCount", @"tips", @"usersCount", @"users", nil];
//
//    [venueMapping mapRelationship:@"stats" withMapping:statsMapping];
//    [objectManager.mappingProvider setMapping:statsMapping forKeyPath:@"stats"];
 */