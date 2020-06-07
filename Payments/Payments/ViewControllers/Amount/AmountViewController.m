//
//  AmountViewController.m
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/6/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import "AmountViewController.h"

@interface AmountViewController ()

@property (weak, nonatomic) IBOutlet UITextField *amount;

@property (strong, nonatomic) NSNumber *currentAmount;

@end

@implementation AmountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _amount.delegate = self;
    
    self.title = @"How much you wanna pay?";
}

- (IBAction)makePayment:(id)sender {
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
}

@end