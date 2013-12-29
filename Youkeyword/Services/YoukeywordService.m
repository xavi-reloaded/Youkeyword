//
// Created by apium on 28/12/13.
// Copyright (c) 2013 apium. All rights reserved.
//

#import <RestKit/RKURL.h>
#import <RestKit/RKObjectManager.h>
#import "YoukeywordService.h"
#import "Keywords.h"


@implementation YoukeywordService {}

@synthesize objectManager,baseURL,responseData;

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


- (void)loadYoukeywordObjectsArResourcePath:(NSDictionary *)queryParams {
    objectManager = [RKObjectManager sharedManager];
    RKURL *URL = [RKURL URLWithBaseURL:[objectManager baseURL] resourcePath:@"/plnKeywordService" queryParameters:queryParams];
    NSString *const path = [NSString stringWithFormat:@"%@?%@", [URL resourcePath], [URL query]];
    [objectManager loadObjectsAtResourcePath:path delegate:self];
}

- (NSDictionary *)getQueryParams:(NSString *)text language:(NSString *)language name:(NSString *)name userId:(NSString *)userId {
    return [NSDictionary dictionaryWithObjectsAndKeys:text, @"w", language, @"l", name, @"name", userId, @"id", nil];
}

#pragma mark - RKObjectLoaderDelegate

- (void)request:(RKRequest*)request didLoadResponse:(RKResponse*)response {
    NSLog(@"\n\nresponse code: %d", [response statusCode]);
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error
{
    NSLog(@"\n\nError: %@", [error localizedDescription]);
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didLoadObjects:(NSArray *)objects
{
    NSLog(@"\n\nobjects[%d]", [objects count]);
    responseData = objects;
}

@end