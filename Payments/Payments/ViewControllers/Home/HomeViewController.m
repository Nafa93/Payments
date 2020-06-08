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
    
    self.title = @"Home";
    
    self.welcomeTitle.text = @"Welcome to payments, would you like go pay something?";
}

- (IBAction)navigateToAmountViewController:(id)sender {
    
    AmountViewController *amountViewController = [[AmountViewController alloc] init];
    
    AmountViewModel *amountViewModel = [[AmountViewModel alloc] init];
    
    amountViewController.amountViewModel = amountViewModel;
    
    [self.navigationController pushViewController:amountViewController animated:YES];
}

@end
