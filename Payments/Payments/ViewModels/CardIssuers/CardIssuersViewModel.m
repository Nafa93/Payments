//
//  CardIssuersViewModel.m
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/8/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import "CardIssuersViewModel.h"
#import "ServiceManager.h"

@implementation CardIssuersViewModel

-(instancetype)initWithPaymentMethodId: (NSString *)paymentMethodId {
    self = [super init];
    if (self) {
        self.paymentMethodId = paymentMethodId;
    }
    return self;
}

-(void) getCardIssuers {
    ServiceManager *sharedInstance = [ServiceManager sharedInstance];

    [sharedInstance getCardIssuersWithPaymentMethodId:_paymentMethodId completionBlock:^(NSMutableArray * _Nonnull cardIssuers) {
        self.cardIssuers = cardIssuers;
        
        [self.delegate cardIssuersFetched:self];
    } failureBlock:^(NSString * _Nonnull error) {
        [self.delegate cardIssuersFailed:self error:error];
    }];
}

@end
