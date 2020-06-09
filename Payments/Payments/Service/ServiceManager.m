//
//  ServiceManager.m
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/7/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import "ServiceManager.h"
#import "AFNetworking.h"
#import "PaymentMethod.h"
#import "CardIssuer.h"
#import "Installment.h"

@implementation ServiceManager

+ (id)sharedInstance {
    static ServiceManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        NSString *path = [[NSBundle mainBundle] pathForResource: @"Service" ofType: @"plist"];
        NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile: path];
        NSDictionary *environment = [(NSDictionary *) dictionary objectForKey: @"Environment"];
        NSDictionary *dev = [(NSDictionary *) environment objectForKey:@"DEV"];
        
        _publicKey = [dev objectForKey:@"public_key"];
        _baseUrl = [dev objectForKey:@"base_url"];
        
        _manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
        [_manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    }
    
    return self;
}

- (void)getPaymentMethods:(void (^)(NSMutableArray *paymentMethods)) completion failureBlock:(nonnull void (^)(NSString * _Nonnull))failure {
    NSString *methodUrl = [_baseUrl stringByAppendingString:@"payment_methods"];
    
    NSDictionary *parameters = @{@"public_key": _publicKey};
    
    NSMutableArray *paymentMethods = [[NSMutableArray alloc] init];
    
    [_manager GET:methodUrl parameters:parameters headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"Method in progress.");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        for (NSDictionary *item in responseObject) {

            PaymentMethod *paymentMethod = [[PaymentMethod alloc] initWithData:item];
            
            [paymentMethods addObject:paymentMethod];
            
        }
        
        completion(paymentMethods);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error.localizedDescription);
        
        NSLog(@"Failed casued by: %@", error.description);
    }];
}

- (void)getCardIssuersWithPaymentMethodId:(NSString *)paymentMethodId completionBlock:(void (^)(NSMutableArray * _Nonnull))completion failureBlock:(void (^)(NSString * _Nonnull))failure {
    NSString *methodUrl = [_baseUrl stringByAppendingString:@"payment_methods/card_issuers"];
    
    NSDictionary *parameters = @{@"public_key": _publicKey, @"payment_method_id": paymentMethodId};
    
    NSMutableArray *cardIssuers = [[NSMutableArray alloc] init];
    
    [_manager GET:methodUrl parameters:parameters headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"Method in progress.");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        for (NSDictionary *item in responseObject) {

            CardIssuer *cardIssuer = [[CardIssuer alloc] initWithData:item];
            
            [cardIssuers addObject:cardIssuer];
            
        }
        
        completion(cardIssuers);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error.localizedDescription);
        
        NSLog(@"Failed casued by: %@", error.description);
    }];
}

- (void)getInstallmentsWithAmount:(double)amount paymentMethodId:(NSString *)paymentMethodId issuerId:(NSString *)issuerId completionBlock:(void (^)(Installment * _Nonnull))completion failureBlock:(void (^)(NSString * _Nonnull))failure {
    
    NSString *selectedAmount = [[[NSNumber alloc] initWithDouble:amount] stringValue];
    
    NSString *methodUrl = [_baseUrl stringByAppendingString:@"payment_methods/installments"];
       
    NSDictionary *parameters = @{@"public_key": _publicKey, @"payment_method_id": paymentMethodId, @"issuer.id": issuerId, @"amount": selectedAmount};

    [_manager GET:methodUrl parameters:parameters headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
       NSLog(@"Method in progress.");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        Installment *installment = [[Installment alloc] initWithData:responseObject];

        completion(installment);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error.localizedDescription);
        
        NSLog(@"Failed casued by: %@", error.description);
    }];
    
}

@end
