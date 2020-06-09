//
//  CheckoutViewModel.h
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/9/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CheckoutViewModel : NSObject

@property (nonatomic, strong) NSString *paymentMethod;
@property (nonatomic, strong) NSString *cardIssuer;
@property (nonatomic, strong) NSString *installment;

@end

NS_ASSUME_NONNULL_END
