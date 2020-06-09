//
//  InstallmentsViewController.h
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/9/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InstallmentsViewModel.h"
#import "UIViewController+Alert.h"
#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface InstallmentsViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource, InstallmentsDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) InstallmentsViewModel *installmentsViewModel;

@end

NS_ASSUME_NONNULL_END
