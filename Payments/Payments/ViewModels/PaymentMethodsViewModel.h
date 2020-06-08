//
//  PaymentMethodsViewModel.h
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/8/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PaymentMethodsViewModel : NSObject

@property (nonatomic, strong) NSMutableArray *paymentMethods;

- (void) getPaymentMethods;

@end

NS_ASSUME_NONNULL_END
