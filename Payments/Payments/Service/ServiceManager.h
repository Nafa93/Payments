//
//  ServiceManager.h
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/7/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface ServiceManager : NSObject

@property (nonatomic, strong) NSString *baseUrl;
@property (nonatomic, strong) NSString *publicKey;
@property (nonatomic, strong) AFHTTPSessionManager *manager;

+ (id) sharedInstance;
- (void) getPaymentMethods;

@end

NS_ASSUME_NONNULL_END
