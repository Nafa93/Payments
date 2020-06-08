//
//  AmountViewModel.m
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/8/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import "AmountViewModel.h"

@implementation AmountViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentAmount = 0.00;
    }
    return self;
}

- (void) updateCurrentAmount:(NSString *) input {
    
    if ([input isEqualToString:@""]) {
        _currentAmount = _currentAmount / 10;
    } else {
        _currentAmount = _currentAmount * 10 + input.doubleValue;
    }
}

- (NSString *) getDisplayableAmount {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    
    [formatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    
    double amountWithDecimals = _currentAmount / 100.00;
    
    NSString *formattedNumber = [formatter stringFromNumber:[[NSNumber alloc] initWithDouble:amountWithDecimals]];
    
    return formattedNumber;
}

@end
