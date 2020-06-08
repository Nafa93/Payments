//
//  PaymentMethodsViewController.m
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/8/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import "PaymentMethodsViewController.h"
#import "PaymentMethodsTableViewCell.h"
#import "PaymentMethod.h"

@interface PaymentMethodsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PaymentMethodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_paymentMethodsViewModel getPaymentMethods];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"PaymentMethodsTableViewCell";
    
    PaymentMethodsTableViewCell *cell = (PaymentMethodsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PaymentMethodsTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    PaymentMethod *paymentMethod = (PaymentMethod *)[_paymentMethodsViewModel.paymentMethods objectAtIndex:indexPath.row];
    
    cell.name.text = paymentMethod.name;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _paymentMethodsViewModel.paymentMethods.count;
}

@end
