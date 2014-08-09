//
//  ModalViewController.m
//  iOS-Challenge-1
//
//  Created by Simon Yang on 8/8/14.
//  Copyright (c) 2014 Simon Yang. All rights reserved.
//

#import "ModalViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RACEXTScope.h"

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:nil action:nil];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:tapGestureRecognizer];
    [tapGestureRecognizer.rac_gestureSignal subscribeNext:^(id x) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hello World" message:@"ohai" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
    }];
    
    @weakify(self);
    self.backButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [RACSignal defer:^RACSignal *{
            // Note: Not happy with how this side effect is applied
            @strongify(self);
            [self dismissViewControllerAnimated:YES completion:nil];
            return [RACSignal empty];
        }];
    }];
}

@end
