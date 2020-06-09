//
//  BaseViewController.h
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/9/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

@property (nonatomic, strong) UIActivityIndicatorView *spinner;

-(void) startLoadingSpinner;
-(void) stopLoadingSpinner;

@end

NS_ASSUME_NONNULL_END
