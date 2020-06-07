//
//  ServiceManager.m
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/7/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import "ServiceManager.h"
#import "AFNetworking.h"

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

-(void) getPaymentMethods {
    NSString *methodUrl = [_baseUrl stringByAppendingString:@"payment_methods"];
    
    NSDictionary *parameters = @{@"public_key": _publicKey};
    
    [_manager GET:methodUrl parameters:parameters headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"Method in progress.");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"Success baby.");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Failed :(");
    }];
}

@end
