//
//  PaymentMethods.h
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/7/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PaymentMethod : NSObject

@property (nonatomic, strong) NSString *paymentMethodId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *paymentTypeId;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *thumbnail;

- (instancetype)initWithData:(NSDictionary *) data;

@end

NS_ASSUME_NONNULL_END
