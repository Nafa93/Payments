//
//  AmountViewController.m
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/6/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import "AmountViewController.h"
#import "PaymentMethodsViewController.h"

@interface AmountViewController ()

@property (weak, nonatomic) IBOutlet UITextField *amount;

@end

@implementation AmountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _amount.delegate = self;
    
    _amount.placeholder = [_amountViewModel getDisplayableAmount];
    
    self.title = @"How much you wanna pay?";
}

- (IBAction)navigateToPaymentMethodsViewController:(id)sender {
    
    PaymentMethodsViewController *paymentMethodsViewController = [[PaymentMethodsViewController alloc] init];
    
    PaymentMethodsViewModel * paymentMethodsViewModel = [[PaymentMethodsViewModel alloc] init];
    
    paymentMethodsViewController.paymentMethodsViewModel = paymentMethodsViewModel;
    
    [self.navigationController pushViewController:paymentMethodsViewController animated:YES];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

    [_amountViewModel updateCurrentAmount:string];
    
    _amount.text = [_amountViewModel getDisplayableAmount];
    
    return NO;
}

@end
