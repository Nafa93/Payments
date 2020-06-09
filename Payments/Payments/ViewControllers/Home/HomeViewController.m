//
//  HomeViewController.m
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/6/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import "HomeViewController.h"
#import "AmountViewController.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *welcomeTitle;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Inicio";
    
    self.welcomeTitle.text = @"Bienvenido a GeoPagos";
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.tintColor = UIColor.whiteColor;
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: UIColor.whiteColor}];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.03 green:0.34 blue:0.8 alpha:1.0];
    
}

- (IBAction)navigateToAmountViewController:(id)sender {
    
    AmountViewController *amountViewController = [[AmountViewController alloc] init];
    
    AmountViewModel *amountViewModel = [[AmountViewModel alloc] init];
    
    amountViewController.amountViewModel = amountViewModel;
    
    [self.navigationController pushViewController:amountViewController animated:YES];
}

@end
