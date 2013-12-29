//
// Created by apium on 28/12/13.
// Copyright (c) 2013 apium. All rights reserved.
//

#import <RestKit/RKURL.h>
#import <RestKit/RKObjectManager.h>
#import "YoukeywordService.h"
#import "Keywords.h"


@implementation YoukeywordService {}

@synthesize objectManager;
@synthesize baseURL;

- (id)init
{
    return [self initWithObjectManager:@"http://54.213.142.98:8080/PLNEngine/service"];
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
    [keywordMapping mapKeyPathsToAttributes:@"lemma", @"lemma", @"namedEntity", @"namedEntity", nil];
    [manager.mappingProvider setMapping:keywordMapping forKeyPath:@""];
    return manager;
}


- (NSString *)responseFromServer {
    NSString *text = @"Luís Alves de Lima e Silva";
    NSString *language = @"en";
    NSString *name = @"name";
    NSString *userId = @"userId";


    NSDictionary *queryParams = [self getQueryParams:text language:language name:name userId:userId];
    /*
    RKURL *URL = [RKURL URLWithBaseURL:[objectManager baseURL] resourcePath:@"/plnKeywordService" queryParameters:queryParams];

    NSLog(@"URL: %@", [URL absoluteString]);
    NSLog(@"resourcePath: %@", [URL resourcePath]);
    NSLog(@"query: %@", [URL query]);

    NSString *const path = [NSString stringWithFormat:@"%@?%@", [URL resourcePath], [URL query]];
    [objectManager loadObjectsAtResourcePath:path delegate:self];*/
    return @"asdf";
}

- (NSDictionary *)getQueryParams:(NSString *)text language:(NSString *)language name:(NSString *)name userId:(NSString *)userId {
    return [NSDictionary dictionaryWithObjectsAndKeys:text, @"w", language, @"l", name, @"name", userId, @"id", nil];
}
@end