//
//  CardIssuer.m
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/8/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import "CardIssuer.h"

@implementation CardIssuer

- (instancetype)initWithData:(NSDictionary *) data {
    self = [super init];
    if (self) {
       _cardIssuerId = [data objectForKey:@"id"];
       _name = [data objectForKey:@"name"];
       _thumbnail = [data objectForKey:@"thumbnail"];
    }
    return self;
}

@end
