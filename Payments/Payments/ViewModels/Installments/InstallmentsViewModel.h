//
//  InstallmentsViewModel.h
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/9/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Installment.h"

NS_ASSUME_NONNULL_BEGIN

@class InstallmentsViewModel;

@protocol InstallmentsDelegate <NSObject>

- (void) installmentsFetched: (InstallmentsViewModel *) sender;
- (void) installmentsFailed: (InstallmentsViewModel *) sender error:(NSString *)error;

@end

@interface InstallmentsViewModel : NSObject

@property (nonatomic, weak) id <InstallmentsDelegate> delegate;

@property (nonatomic, strong) Installment *installment;

@property (nonatomic, strong) NSString *paymentMethodId;

@property (nonatomic, strong) NSString *issuerId;

@property (nonatomic, strong) NSString *paymentMethod;

@property (nonatomic, strong) NSString *cardIssuer;

@property (nonatomic, assign) double selectedAmount;

-(void) getInstallments;

@end

NS_ASSUME_NONNULL_END
