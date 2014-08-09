//
//  FormViewController.h
//  iOS-Challenge-1
//
//  Created by Simon Yang on 8/8/14.
//  Copyright (c) 2014 Simon Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FormViewModel;

@interface FormViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *usernameField;
@property (nonatomic, weak) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;
@property (nonatomic, weak) IBOutlet UIButton *submitButton;

@property (nonatomic) FormViewModel *viewModel;

@end
