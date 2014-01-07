//
// Created by apium on 07/01/14.
// Copyright (c) 2014 apium. All rights reserved.
//

#import "FormadisimoService.h"


@implementation FormadisimoService {

}
- (NSString *)getBaseURL {
    return [self.baseURL stringByAppendingString:@"/ws"];
}

- (id)initWithCustomURL:(NSString *)string {
    self.baseURL = string;
    return self;
}
@end