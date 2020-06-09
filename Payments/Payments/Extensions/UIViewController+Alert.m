//
//  UIViewController+Alert.m
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/9/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIViewController+Alert.h"

@implementation UIViewController (AlertExtension)

- (void)showAlertWithTitle:(NSString *)title andMessage:(NSString*)message  buttonTitle:(NSString *)buttonTitle andHandler:(void (^)(UIAlertAction * action))handler {
    UIAlertController* alert = [UIAlertController
                                alertControllerWithTitle:title
                                message:message
                                preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* newButton = [UIAlertAction
                               actionWithTitle:buttonTitle
                               style:UIAlertActionStyleDefault
                               handler:handler];
    
    [alert addAction:newButton];

    [self presentViewController:alert animated:YES completion:nil];
}

@end
