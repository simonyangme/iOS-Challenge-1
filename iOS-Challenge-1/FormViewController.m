//
//  FormViewController.m
//  iOS-Challenge-1
//
//  Created by Simon Yang on 8/8/14.
//  Copyright (c) 2014 Simon Yang. All rights reserved.
//

#import "FormViewController.h"
#import "FormViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RACEXTScope.h"
#import "ModalViewController.h"

@implementation FormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // initial RAC bindings
    RAC(self.viewModel, username) = self.usernameField.rac_textSignal;
    RAC(self.viewModel, password) = self.passwordField.rac_textSignal;
    
    RAC(self.errorLabel, text) = [self.viewModel.isValidSignal reduceEach:^id(NSValue *successValue, NSString *message){
        return message;
    }];
    
    @weakify(self);
    self.submitButton.rac_command = [[RACCommand alloc]
                                     initWithEnabled:[self.viewModel.isValidSignal
                                                      reduceEach:^id(NSValue *successValue, NSString *message){
                                                          return successValue;
                                                      }]
                                     signalBlock:^RACSignal *(id input) {
                                         ModalViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ModalViewController"];
                                         @strongify(self);
                                         // This side effect application feels smelly :(
                                         [self presentViewController:viewController animated:YES completion:nil];
                                         return [RACSignal empty];
                                     }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.usernameField.text = @"";
    self.passwordField.text = @"";
    
    self.viewModel.username = @"";
    self.viewModel.password = @"";
}

@end
