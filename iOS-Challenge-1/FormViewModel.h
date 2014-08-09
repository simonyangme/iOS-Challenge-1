//
//  FormViewModel.h
//  iOS-Challenge-1
//
//  Created by Simon Yang on 8/8/14.
//  Copyright (c) 2014 Simon Yang. All rights reserved.
//

#import "RVMViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface FormViewModel : RVMViewModel

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;

/**
 Returns a RACTuple with the following: (NSValue-wrapped BOOL) success, (NSString *) message
 
 Message contains error when success is NO
 */
@property (nonatomic, readonly) RACSignal *isValidSignal;

@end
