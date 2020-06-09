//
//  InstallmentsViewController.m
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/9/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import "InstallmentsViewController.h"
#import "InstallmentsTableViewCell.h"
#import "Installment.h"

@interface InstallmentsViewController ()

@end

@implementation InstallmentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.installmentsViewModel.delegate = self;
    
}

-(void) navigateToCheckout:(NSString *) issuerId {
//    CheckoutViewController *checkoutViewController = [[CheckoutViewController alloc] init];
//
//    CheckoutViewModel *checkoutViewModel = [[CheckoutViewModel alloc] init];
//
//    checkoutViewController.checkoutViewModel = checkoutViewModel;
//
//    [self.navigationController pushViewController:checkoutViewController animated:YES];
}

- (void)installmentsFetched:(InstallmentsViewModel *)sender {
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"InstallmentsTableViewCell";
    
    InstallmentsTableViewCell *cell = (InstallmentsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"InstallmentsTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    Installment *installment = (Installment *)[_installmentsViewModel.installments objectAtIndex:indexPath.row];
    
    cell.name.text = installment.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Installment *installment = (Installment *)[_installmentsViewModel.installments objectAtIndex:indexPath.row];
    
    [self navigateToCheckout:installment.issuerId];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _installmentsViewModel.installments.count;
}


@end
