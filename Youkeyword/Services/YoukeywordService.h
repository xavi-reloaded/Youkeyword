//
// Created by apium on 28/12/13.
// Copyright (c) 2013 apium. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface YoukeywordService : NSObject
{
    // Protected instance variables

}

+ (void)setBaseUrl:(NSString *)url;

@property(nonatomic, assign) NSString *baseurl;

- (NSString *)responseFromServer;

@end