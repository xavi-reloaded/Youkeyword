//
// Created by apium on 28/12/13.
// Copyright (c) 2013 apium. All rights reserved.
//

#import "YKNote.h"

@implementation YKNote

+ (YKNote *)noteWithText:(NSString *)text {
    YKNote* note = [YKNote new];
    note.contents = text;
    note.timestamp = [NSDate date];
    return note;
}

- (NSString *)title {
    // split into lines
    NSArray* lines = [self.contents componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]];

    // return the first
    return lines[0];
}

@end