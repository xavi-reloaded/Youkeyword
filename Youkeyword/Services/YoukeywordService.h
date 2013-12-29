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
@property (strong, nonatomic) NSArray *responseData;

@property(nonatomic, strong) NSObject *delegateClass;

- (id)init:(NSObject *)delegateClass;

- (NSString *)loadYoukeywordObjectsArResourcePath:(NSDictionary *)queryParams;
- (NSString *)loadYoukeywordObjectsFromText:(NSString *)text;
- (NSDictionary *)getQueryParams:(NSString *)text language:(NSString *)language name:(NSString *)name userId:(NSString *)userId;
- (RKObjectManager *)configureMappingForObjectManager:(RKObjectManager *)manager;

@end