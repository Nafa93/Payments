//
//  CardIssuersViewController.m
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/8/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import "CardIssuersViewController.h"
#import "CardIssuersTableViewCell.h"
#import "CardIssuer.h"
#import "InstallmentsViewController.h"
#import "InstallmentsViewModel.h"

@interface CardIssuersViewController ()

@end

@implementation CardIssuersViewController

@synthesize tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Emisores de Tarjetas";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    _cardIssuersViewModel.delegate = self;
    
    self.tableView.hidden = YES;
    [self startLoadingSpinner];
    
    [_cardIssuersViewModel getCardIssuers];
}

-(void) navigateToInstallmentsViewController:(NSString *) issuerId :(NSString *) cardIssuer {
    InstallmentsViewController *installmentsViewController = [[InstallmentsViewController alloc] init];
    
    InstallmentsViewModel * installmentsViewModel = [[InstallmentsViewModel alloc] init];
    
    installmentsViewModel.paymentMethodId = _cardIssuersViewModel.paymentMethodId;
    
    installmentsViewModel.issuerId = issuerId;
    
    installmentsViewModel.selectedAmount = _cardIssuersViewModel.selectedAmount;
    
    installmentsViewModel.paymentMethod = _cardIssuersViewModel.paymentMethod;
    
    installmentsViewModel.cardIssuer = cardIssuer;
    
    installmentsViewController.installmentsViewModel = installmentsViewModel;
    
    [self.navigationController pushViewController:installmentsViewController animated:YES];
}

- (void)cardIssuersFetched:(CardIssuersViewModel *)sender {
    self.tableView.hidden = NO;
    [self stopLoadingSpinner];
    
    if (_cardIssuersViewModel.cardIssuers.count == 0) {
        [self showAlertWithTitle:@"Error" andMessage:@"Por el momento no hay informacion para mostrar." buttonTitle:@"Volver atras" andHandler:^(UIAlertAction *action) {
            [self.navigationController popViewControllerAnimated:true];
        }];
        
        return;
    }
    
    [self.tableView reloadData];
}

- (void)cardIssuersFailed:(CardIssuersViewModel *)sender error:(NSString *)error {
    self.tableView.hidden = NO;
    [self stopLoadingSpinner];
    
    [self showAlertWithTitle:@"Error" andMessage:error buttonTitle:@"Volver atras" andHandler:^(UIAlertAction *action) {
        [self.navigationController popViewControllerAnimated:true];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CardIssuersTableViewCell";
    
    CardIssuersTableViewCell *cell = (CardIssuersTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CardIssuersTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    CardIssuer *cardIssuer = (CardIssuer *)[_cardIssuersViewModel.cardIssuers objectAtIndex:indexPath.row];
    
    cell.name.text = cardIssuer.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CardIssuer *cardIssuer = (CardIssuer *)[_cardIssuersViewModel.cardIssuers objectAtIndex:indexPath.row];
    
    [self navigateToInstallmentsViewController:cardIssuer.cardIssuerId:cardIssuer.name];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cardIssuersViewModel.cardIssuers.count;
}

@end
