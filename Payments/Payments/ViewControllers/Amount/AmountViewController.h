//
//  AmountViewController.h
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/6/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AmountViewModel.h"
#import "UIViewController+Alert.h"

NS_ASSUME_NONNULL_BEGIN

@interface AmountViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) AmountViewModel *amountViewModel;

@end

NS_ASSUME_NONNULL_END
