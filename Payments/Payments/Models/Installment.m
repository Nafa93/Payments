//
//  Installment.m
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/9/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import "Installment.h"
#import "PayerCost.h"

@implementation Installment

- (instancetype)initWithData:(NSDictionary *) data {
    self = [super init];
    if (self) {
        
        _payerCosts = [[NSMutableArray alloc] init];
        
        NSMutableArray *array = data.mutableCopy;
        
        NSDictionary *issuer = [(NSDictionary *)[array objectAtIndex:0] objectForKey:@"issuer"];
        
        _name = [issuer objectForKey:@"name"];
        _issuerId = [issuer objectForKey:@"id"];
        _thumbnail = [issuer objectForKey:@"thumbnail"];
        
        NSDictionary *payerCosts = [(NSDictionary *)[array objectAtIndex:0] objectForKey:@"payer_costs"];
        
        for (NSDictionary *payerCostDictionary in payerCosts) {
            PayerCost *payerCost = [[PayerCost alloc] initWithData:payerCostDictionary];
            
            [_payerCosts addObject:payerCost];
        }
    }
    return self;
}

@end
