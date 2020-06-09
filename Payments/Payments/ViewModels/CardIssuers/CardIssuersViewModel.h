//
//  CardIssuersViewModel.h
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/8/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class CardIssuersViewModel;

@protocol CardIssuersDelegate <NSObject>

- (void) cardIssuersFetched: (CardIssuersViewModel *) sender;
- (void) cardIssuersFailed: (CardIssuersViewModel *) sender error:(NSString *) error;

@end

@interface CardIssuersViewModel : NSObject

@property (nonatomic, weak) id <CardIssuersDelegate> delegate;
@property (nonatomic, strong) NSString *paymentMethodId;
@property (nonatomic, strong) NSMutableArray *cardIssuers;

@property (nonatomic, strong) NSString *paymentMethod;
@property (nonatomic, assign) double selectedAmount;

-(instancetype)initWithPaymentMethodId: (NSString *)paymentMethodId;

-(void) getCardIssuers;

@end

NS_ASSUME_NONNULL_END
