//
// Created by apium on 29/12/13.
// Copyright (c) 2013 apium. All rights reserved.
//

#import <RestKit/RKRequest.h>
#import <RestKit/RKObjectLoader.h>
#import "DummyDelegateClass.h"


@implementation DummyDelegateClass {

    NSArray *responseData;
}

#pragma mark - RKObjectLoaderDelegate

@synthesize responseData;

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