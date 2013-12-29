//
// Created by apium on 28/12/13.
// Copyright (c) 2013 apium. All rights reserved.
//

#import <RestKit/RKURL.h>
#import <RestKit/RKObjectManager.h>
#import "YoukeywordService.h"


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
    }
    return self;
}


- (NSString *)responseFromServer {
    return @"weke";
}
@end