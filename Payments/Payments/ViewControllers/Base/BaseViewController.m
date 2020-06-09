//
//  BaseViewController.m
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/9/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    _spinner.center = [UIApplication sharedApplication].windows[0].center;
}

- (void)startLoadingSpinner {
    [self.view addSubview:_spinner];
    [_spinner startAnimating];
}

- (void)stopLoadingSpinner {
    [_spinner removeFromSuperview];
}

@end
