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

    [sharedInstance getInstallmentsWithAmount:_selectedAmount paymentMethodId:_paymentMethodId issuerId:_issuerId completionBlock:^(Installment * _Nonnull installment) {
        self.installment = installment;
        
        [self.delegate installmentsFetched:self];
    } failureBlock:^(NSString * _Nonnull error) {
        [self.delegate installmentsFailed:self error:error];
    }];
}

@end
