//
//  InstallmentsViewModel.m
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/9/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import "InstallmentsViewModel.h"
#import "ServiceManager.h"

@implementation InstallmentsViewModel

-(void) getInstallments {
    ServiceManager *sharedInstance = [ServiceManager sharedInstance];

    [sharedInstance getInstallments: _selectedAmount :_paymentMethodId :_issuerId :^(Installment * _Nonnull installment) {
        self.installment = installment;
        
        [self.delegate installmentsFetched:self];
    }];
}

@end
