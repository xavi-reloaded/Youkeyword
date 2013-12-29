//
// Created by apium on 28/12/13.
// Copyright (c) 2013 apium. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RKURL;
@class RKObjectManager;


@interface YoukeywordService : NSObject
{
    // Protected instance variables

}

@property(nonatomic, strong) RKURL *baseURL;
@property(nonatomic, strong) RKObjectManager *objectManager;

- (NSString *)responseFromServer;
- (NSDictionary *)getQueryParams:(NSString *)text language:(NSString *)language name:(NSString *)name userId:(NSString *)userId;

@end