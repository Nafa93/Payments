//
//  CheckoutViewController.m
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/9/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import "CheckoutViewController.h"

@interface CheckoutViewController ()

@end

@implementation CheckoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Pago Finalizado";
    
    self.navigationItem.hidesBackButton = YES;
    
    _paymentMethod.text = _checkoutViewModel.paymentMethod;
    
    _cardIssuer.text = _checkoutViewModel.cardIssuer;
    
    _installment.text = _checkoutViewModel.installment;
}

- (IBAction)goBackToHome:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
