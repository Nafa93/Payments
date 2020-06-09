//
//  PaymentMethodsViewModel.h
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/8/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class PaymentMethodsViewModel;

@protocol PaymentMethodsDelegate <NSObject>

- (void) paymentMethodsFetched: (PaymentMethodsViewModel *) sender;
- (void) paymentMethodsFailed: (PaymentMethodsViewModel *) sender error:(NSString *)error;

@end

@interface PaymentMethodsViewModel : NSObject

@property (nonatomic, strong) NSMutableArray *paymentMethods;
@property (nonatomic, assign) double selectedAmount;

@property (nonatomic, weak) id <PaymentMethodsDelegate> delegate;

- (void) getPaymentMethods;

@end

NS_ASSUME_NONNULL_END
