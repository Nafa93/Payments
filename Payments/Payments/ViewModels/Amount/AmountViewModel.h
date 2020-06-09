//
//  AmountViewModel.h
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/8/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AmountViewModel : NSObject

@property (nonatomic, assign) double currentAmount;

- (void) updateCurrentAmount: (NSString *) input;

- (NSString *) getDisplayableAmount;

@end

NS_ASSUME_NONNULL_END
