//
//  UIViewController+Alert.h
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/9/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#ifndef UIViewController_Alert_h
#define UIViewController_Alert_h

#import <UIKit/UIKit.h>

@interface UIViewController (AlertExtension)

- (void) showAlertWithTitle:(NSString *)title andMessage:(NSString *)message  buttonTitle:(NSString *)buttonTitle andHandler:(void (^)(UIAlertAction * action))handler;

@end


#endif /* UIViewController_Alert_h */
