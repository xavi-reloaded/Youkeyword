//
// Created by apium on 22/12/13.
// Copyright (c) 2013 4 Arrows Media. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YKMeanings;
@class YKSearchResponse;


@interface Keywords : NSObject

@property (nonatomic, strong) NSString *lemma;
@property (nonatomic, strong) NSString *namedEntity;
@property (nonatomic, strong) NSArray *categories;
@property (nonatomic, strong) NSArray *meanings;
@property (nonatomic, strong) NSArray *searchResponse;

@end