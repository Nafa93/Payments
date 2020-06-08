//
//  PaymentMethods.m
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/7/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import "PaymentMethod.h"

@implementation PaymentMethod

- (instancetype)initWithData:(NSDictionary *) data {
    self = [super init];
    if (self) {
        _paymentMethodId = [data objectForKey:@"id"];
        _name = [data objectForKey:@"name"];
        _paymentTypeId = [data objectForKey:@"payment_type_id"];
        _status = [data objectForKey:@"status"];
        _thumbnail = [data objectForKey:@"thumbnail"];
    }
    return self;
}

@end
