//
//  CardIssuersViewController.m
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/8/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import "CardIssuersViewController.h"
#import "CardIssuer.h"

@interface CardIssuersViewController ()

@end

@implementation CardIssuersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _cardIssuersViewModel.delegate = self;
    
    [_cardIssuersViewModel getCardIssuers];
}

- (void)cardIssuersFetched:(CardIssuersViewModel *)sender {
    for (CardIssuer *cardIssuer in _cardIssuersViewModel.cardIssuers) {
        NSLog(@"%@", cardIssuer.name);
    }
}

@end
