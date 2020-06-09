//
//  InstallmentsViewController.m
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/9/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import "InstallmentsViewController.h"
#import "CheckoutViewController.h"
#import "CheckoutViewModel.h"
#import "InstallmentsTableViewCell.h"
#import "Installment.h"
#import "PayerCost.h"

@interface InstallmentsViewController ()

@end

@implementation InstallmentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Cuotas";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.installmentsViewModel.delegate = self;
    
    [_installmentsViewModel getInstallments];
    
}

-(void) navigateToCheckout:(NSString *) issuerId :(NSString *) chosenInstallment {
    CheckoutViewController *checkoutViewController = [[CheckoutViewController alloc] init];

    CheckoutViewModel *checkoutViewModel = [[CheckoutViewModel alloc] init];
    
    checkoutViewModel.cardIssuer = _installmentsViewModel.cardIssuer;
    
    checkoutViewModel.paymentMethod = _installmentsViewModel.paymentMethod;
    
    checkoutViewModel.installment = chosenInstallment;

    checkoutViewController.checkoutViewModel = checkoutViewModel;

    [self.navigationController pushViewController:checkoutViewController animated:YES];
}

- (void)installmentsFetched:(InstallmentsViewModel *)sender {
    if (_installmentsViewModel.installment.payerCosts.count == 0) {
        [self showAlertWithTitle:@"Error" andMessage:@"Por el momento no hay informacion para mostrar." buttonTitle:@"Volver atras" andHandler:^(UIAlertAction *action) {
            [self.navigationController popViewControllerAnimated:true];
        }];
        
        return;
    }
    
    [self.tableView reloadData];
}

- (void)installmentsFailed:(InstallmentsViewModel *)sender error:(NSString *)error {
    [self showAlertWithTitle:@"Error" andMessage:error buttonTitle:@"Volver atras" andHandler:^(UIAlertAction *action) {
        [self.navigationController popViewControllerAnimated:true];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"InstallmentsTableViewCell";
    
    InstallmentsTableViewCell *cell = (InstallmentsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"InstallmentsTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    PayerCost *payerCost = (PayerCost *)[_installmentsViewModel.installment.payerCosts objectAtIndex:indexPath.row];
    
    cell.name.text = payerCost.recommendedMessage;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PayerCost *payerCost = (PayerCost *)[_installmentsViewModel.installment.payerCosts objectAtIndex:indexPath.row];
    
    [self navigateToCheckout:self.installmentsViewModel.issuerId:payerCost.recommendedMessage];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _installmentsViewModel.installment.payerCosts.count;
}


@end
