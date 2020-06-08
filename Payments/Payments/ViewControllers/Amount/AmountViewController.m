//
//  AmountViewController.m
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/6/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import "AmountViewController.h"
#import "ServiceManager.h"

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
    ServiceManager *sharedInstance = [ServiceManager sharedInstance];
    
    [sharedInstance getPaymentMethods:^(NSMutableArray * _Nonnull paymentMethods) {
        for (PaymentMethod *paymentMethod in paymentMethods) {
            NSLog(paymentMethod.name);
        }
    }];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
}

@end
