//
//  ZTTableViewController.m
//
//  Created by 马成林 on 15/8/17.
//  Copyright (c) 2015年 FingerBiscuit. All rights reserved.
//

#import "ZTTableViewController.h"
#import "ZTTableDataSource.h"
#import "ZTTableViewCell.h"

@interface ZTTableViewController ()

@end

@implementation ZTTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
    [self.view addSubview:table];
    table.delegate = self;
    self.tableView = table;
    
}

- (void)setDataSource:(id<UITableViewDataSource>)dataSource{
    if (_dataSource!=dataSource) {
        _dataSource = dataSource;
        _tableView.dataSource = _dataSource;
    }
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark-UITableViewDelegate代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([tableView.dataSource isKindOfClass:[ZTTableDataSource class]]) {
        id <ZTTableViewDataSourceInterface> dataSource = (id <ZTTableViewDataSourceInterface>) tableView.dataSource;
        id object = [dataSource tableView:tableView objectForRowAtIndexPath:indexPath];
        Class cls = [dataSource tableView:tableView cellClassForObject:object];
        return [cls tableView:tableView rowHeightForObject:object];
    }
    return ZTDefaultRowHeight;
}
@end
