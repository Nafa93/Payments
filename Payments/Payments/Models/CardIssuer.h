//
//  CardIssuer.h
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/8/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CardIssuer : NSObject

@property (nonatomic, strong) NSString *cardIssuerId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *thumbnail;

- (instancetype)initWithData:(NSDictionary *) data;

@end

NS_ASSUME_NONNULL_END
