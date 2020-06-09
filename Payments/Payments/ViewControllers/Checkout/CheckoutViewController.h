//
//  CheckoutViewController.h
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/9/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckoutViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CheckoutViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *paymentMethod;
@property (weak, nonatomic) IBOutlet UILabel *cardIssuer;
@property (weak, nonatomic) IBOutlet UILabel *installment;

@property (nonatomic, strong) CheckoutViewModel *checkoutViewModel;

@end

NS_ASSUME_NONNULL_END
