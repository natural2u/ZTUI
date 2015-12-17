//
//  ZTTableDataSource.h
//
//  Created by 马成林 on 15/8/17.
//  Copyright (c) 2015年 FingerBiscuit. All rights reserved.
//
#import <UIKit/UIKit.h>
@protocol ZTTableViewDataSourceInterface <UITableViewDataSource>

- (id)tableView:(UITableView *)tableView objectForRowAtIndexPath:(NSIndexPath *)indexPath;

- (Class)tableView:(UITableView *)tableView cellClassForObject:(id)object;

- (NSIndexPath *)tableView:(UITableView *)tableView indexPathForObject:(id)object;

- (void)tableView:(UITableView *)tableView cell:(UITableViewCell *)cell willAppearAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface ZTTableDataSource : NSObject<ZTTableViewDataSourceInterface>
@property (nonatomic,strong) NSArray *items;

/**
 *  生成tableView的datasource
 *
 *  @param items items  数据源，每个cell对应的object
 *
 *  @return datasource
 */
- (instancetype)initWithItems:(NSArray *)items;

@end
