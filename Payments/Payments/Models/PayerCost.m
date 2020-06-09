//
//  PayerCosts.m
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/9/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import "PayerCost.h"

@implementation PayerCost

- (instancetype)initWithData:(NSDictionary *) data {
    self = [super init];
    if (self) {
        _recommendedMessage = [data objectForKey:@"recommended_message"];
    }
    return self;
}

@end
