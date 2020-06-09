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
    
    self.title = @"Monto a Pagar";
}

-(void)displayErrorAlert {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Error"
                                 message:@"Debes ingresar un valor para continuar"
                                 preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:@"Ok"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {}];

    [alert addAction:okButton];

    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)navigateToPaymentMethodsViewController:(id)sender {
    
    if (_amountViewModel.selectedAmount == 0) {
        [self displayErrorAlert];
        
        return;
    }
    
    PaymentMethodsViewController *paymentMethodsViewController = [[PaymentMethodsViewController alloc] init];
    
    PaymentMethodsViewModel * paymentMethodsViewModel = [[PaymentMethodsViewModel alloc] init];
    
    paymentMethodsViewModel.selectedAmount = [_amountViewModel selectedAmount];
    
    paymentMethodsViewController.paymentMethodsViewModel = paymentMethodsViewModel;
    
    [self.navigationController pushViewController:paymentMethodsViewController animated:YES];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

    [_amountViewModel updateCurrentAmount:string];
    
    _amount.text = [_amountViewModel getDisplayableAmount];
    
    return NO;
}

@end
