//
//  Installment.h
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/9/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Installment : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *issuerId;

@end

NS_ASSUME_NONNULL_END
