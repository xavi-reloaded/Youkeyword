//
// Created by apium on 28/12/13.
// Copyright (c) 2013 apium. All rights reserved.
//

#import <RestKit/RKURL.h>
#import <RestKit/RKObjectManager.h>
#import "YoukeywordService.h"
#import "Keywords.h"
#import "DummyDelegateClass.h"
#import "YKMeanings.h"


@implementation YoukeywordService {}

@synthesize objectManager,baseURL,responseData;

- (id)init {
    return [self init:self];
}

- (id)init:(NSObject *)delegateClass {
    self.delegateClass = delegateClass;
    return [self initWithObjectManager:@"http://localhost:8080/PLNEngine/service"];;
}

- (id)initWithObjectManager:(NSString *)baseURLString {
    self = [super init];
    if (self)
    {
        baseURL = [RKURL URLWithBaseURLString:baseURLString];
        objectManager = [RKObjectManager objectManagerWithBaseURL:baseURL];
        objectManager.client.baseURL = baseURL;
        objectManager = [self configureMappingForObjectManager:objectManager];
    }
    return self;
}

- (RKObjectManager *)configureMappingForObjectManager:(RKObjectManager *)manager {

    RKObjectMapping *keywordMapping = [RKObjectMapping mappingForClass:[Keywords class]];
    [keywordMapping mapKeyPathsToAttributes:@"lemma", @"lemma", @"namedEntity", @"namedEntity",@"categories", @"categories",@"meannings",@"meanings",@"searchResponse",@"searchResponse", nil];
    [manager.mappingProvider setMapping:keywordMapping forKeyPath:@""];


//    RKObjectMapping *keywordMeaningsMapping = [RKObjectMapping mappingForClass:[YKMeanings class]];
//    [keywordMeaningsMapping mapKeyPathsToAttributes:@"concept",@"concept", nil];
//
//    [manager.mappingProvider setMapping:keywordMeaningsMapping forKeyPath:@"meannings"];
//
//    [keywordMapping mapRelationship:@"meanings" withMapping:keywordMeaningsMapping];

//    [venueMapping mapRelationship:@"stats" withMapping:statsMapping];
//    [objectManager.mappingProvider setMapping:statsMapping forKeyPath:@"stats"];

    return manager;
}



- (void)loadYoukeywordObjectsFromText:(NSString *)text {
    NSString *const language = @"en";
    NSString *const name = @"name";
    NSString *const userId = @"userid";
    NSDictionary *queryParams = [self getQueryParams:text language:language name:name userId:userId];
    [self loadYoukeywordObjectsArResourcePath:queryParams];
}

- (void)loadYoukeywordObjectsArResourcePath:(NSDictionary *)queryParams {
    objectManager = [RKObjectManager sharedManager];
    RKURL *URL = [RKURL URLWithBaseURL:[objectManager baseURL] resourcePath:@"/plnKeywordService" queryParameters:queryParams];
    NSString *const path = [NSString stringWithFormat:@"%@?%@", [URL resourcePath], [URL query]];
    [objectManager loadObjectsAtResourcePath:path delegate:[self delegateClass]];
}

- (NSDictionary *)getQueryParams:(NSString *)text language:(NSString *)language name:(NSString *)name userId:(NSString *)userId {
    return [NSDictionary dictionaryWithObjectsAndKeys:text, @"w", language, @"l", name, @"name", userId, @"id", nil];
}

@end