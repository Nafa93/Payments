//
//  PaymentMethodsViewModel.m
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/8/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import "PaymentMethodsViewModel.h"
#import "ServiceManager.h"

@implementation PaymentMethodsViewModel

-(void) getPaymentMethods {
    ServiceManager *sharedInstance = [ServiceManager sharedInstance];

    [sharedInstance getPaymentMethods:^(NSMutableArray * _Nonnull paymentMethods) {
        self.paymentMethods = paymentMethods;
    }];
}

@end
