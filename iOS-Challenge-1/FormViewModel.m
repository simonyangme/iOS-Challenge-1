//
//  FormViewModel.m
//  iOS-Challenge-1
//
//  Created by Simon Yang on 8/8/14.
//  Copyright (c) 2014 Simon Yang. All rights reserved.
//

#import "FormViewModel.h"
#import "RACEXTScope.h"
#import "NSString+FormSupport.h"

@interface FormViewModel ()

@property (nonatomic) RACSignal *isValidSignal;
@property (nonatomic) RACCommand *submitCommand;

@end

@implementation FormViewModel

- (RACSignal *)isValidSignal {
    if (!_isValidSignal) {
        _isValidSignal = [RACSignal
                          combineLatest:@[
                                          RACObserve(self, username),
                                          RACObserve(self, password)
                                          ]
                          reduce:^id(NSString *username, NSString *password){
                              // This bit of code can use some cleaning up :(
                              if (username.length == 0) {
                                  return RACTuplePack(@(NO), @"");
                              }
                              if (!username.isAlphabetic) {
                                  return RACTuplePack(@(NO), @"username must not contain non-alphabetic characters");
                              }
                              if (username.length < 8) {
                                  return RACTuplePack(@(NO), @"username must be at least 8 characters long");
                              }
                              if (password.length == 0) {
                                  return RACTuplePack(@(NO), @"");
                              }
                              if (password.length < 8) {
                                  return RACTuplePack(@(NO), @"password must be at least 8 characters long");
                              }
                              return RACTuplePack(@(YES), nil);
                          }];
    }
    return _isValidSignal;
}

@end
