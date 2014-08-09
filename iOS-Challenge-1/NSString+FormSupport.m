//
//  NSString+FormSupport.m
//  iOS-Challenge-1
//
//  Created by Simon Yang on 8/8/14.
//  Copyright (c) 2014 Simon Yang. All rights reserved.
//

#import "NSString+FormSupport.h"

@implementation NSString (FormSupport)

- (BOOL)isAlphabetic {
    NSCharacterSet *invalidSet = [[NSCharacterSet letterCharacterSet] invertedSet];
    return [self rangeOfCharacterFromSet:invalidSet].location == NSNotFound;
}

@end
