//
//  CardIssuersViewController.h
//  Payments
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 6/8/20.
//  Copyright © 2020 Nicolas Alejandro Fernandez Amorosino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardIssuersViewModel.h"
#import "UIViewController+Alert.h"
#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CardIssuersViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource, CardIssuersDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) CardIssuersViewModel *cardIssuersViewModel;

@end

NS_ASSUME_NONNULL_END
