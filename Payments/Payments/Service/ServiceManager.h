//
//  ServiceManager.h
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/7/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "PaymentMethod.h"
#import "Installment.h"

NS_ASSUME_NONNULL_BEGIN

@interface ServiceManager : NSObject

@property (nonatomic, strong) NSString *baseUrl;
@property (nonatomic, strong) NSString *publicKey;
@property (nonatomic, strong) AFHTTPSessionManager *manager;

+(id) sharedInstance;
-(void) getPaymentMethods:(void (^)(NSMutableArray *paymentMethods)) completion;
-(void) getCardIssuers: (NSString *) paymentMethodId: (void (^)(NSMutableArray *cardIssuers)) completion;
-(void) getInstallments:(double) amount :(NSString *)paymentMethodId :(NSString *)issuerId :(void (^)(Installment * _Nonnull))completion;

@end

NS_ASSUME_NONNULL_END
