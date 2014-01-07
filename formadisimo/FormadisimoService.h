//
// Created by apium on 07/01/14.
// Copyright (c) 2014 apium. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FormadisimoService : NSObject

@property(nonatomic, copy) NSString *baseURL;

- (NSString *)getBaseURL;

- (id)initWithCustomURL:(NSString *)string;
@end