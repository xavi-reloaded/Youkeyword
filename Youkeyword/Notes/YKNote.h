//
// Created by apium on 28/12/13.
// Copyright (c) 2013 apium. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface YKNote : NSObject
@property NSString* contents;
@property NSDate* timestamp;

// an automatically generated not title, based on the first few words
@property (readonly) NSString* title;

+ (YKNote*) noteWithText:(NSString*)text;

@end