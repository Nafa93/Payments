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

@interface CardIssuersViewController ()

@end

@implementation CardIssuersViewController

@synthesize tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    _cardIssuersViewModel.delegate = self;
    
    [_cardIssuersViewModel getCardIssuers];
}

-(void) navigateToInstallmentsViewController:(NSString *) issuerId {
    InstallmentsViewController *installmentsViewController = [[InstallmentsViewController alloc] init];
    
    InstallmentsViewModel * installmentsViewModel = [[InstallmentsViewModel alloc] init];
    
    installmentsViewController.installmentsViewModel = installmentsViewModel;
    
    [self.navigationController pushViewController:installmentsViewController animated:YES];
}

- (void)cardIssuersFetched:(CardIssuersViewModel *)sender {
    [self.tableView reloadData];
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
    
    [self navigateToInstallmentsViewController:cardIssuer.cardIssuerId];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cardIssuersViewModel.cardIssuers.count;
}

@end
