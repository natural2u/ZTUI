//
//  ZTTableViewController.h
//
//  Created by 马成林 on 15/8/17.
//  Copyright (c) 2015年 FingerBiscuit. All rights reserved.
//
#define ZTDefaultRowHeight 44.0f
#import "ZTBaseViewController.h"

@interface ZTTableViewController : ZTBaseViewController<UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) id<UITableViewDataSource> dataSource;

@end
