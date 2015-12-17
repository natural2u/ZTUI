//
//  ZTTableDataSource.m
//
//  Created by 马成林 on 15/8/17.
//  Copyright (c) 2015年 FingerBiscuit. All rights reserved.
//

#import "ZTTableDataSource.h"
#import "ZTBaseItem.h"
#import "ZTTableViewCell.h"
#import <objc/runtime.h>
@interface ZTTableDataSource()
@end

@implementation ZTTableDataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (instancetype)initWithItems:(NSArray *)items{
    self = [super init];
    if (self) {
        self.items = items;
    }
    return self;
}

#pragma mark-UITableViewDataSource代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    id object = [self tableView:tableView objectForRowAtIndexPath:indexPath];
    Class cellClass = [self tableView:tableView cellClassForObject:object];
    NSString *identifier = [cellClass cellIdentifier];
    if (!identifier) {
        const char *className = class_getName(cellClass);
        identifier = [[NSString alloc]
                      initWithBytesNoCopy:(char *)
                      className
                      length:strlen(className)
                      encoding:NSASCIIStringEncoding
                      freeWhenDone:NO];
    }
    UITableViewCell *cell =
    (UITableViewCell *) [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        NSString *nibName = nil;
        if ([cellClass isSubclassOfClass:[ZTTableViewCell class]]) {
            nibName = [cellClass nibName];
        }
        if (nibName) {
            if ([[NSBundle mainBundle] pathForResource:nibName ofType:@"nib"] != nil) {
                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
                if (nib && nib.count > 0) {
                    cell = (UITableViewCell *) [nib objectAtIndex:0];
                }
            }
            else {
                cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault
                                        reuseIdentifier:identifier];
            }
        } else {
            cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:identifier];
        }
    }
    
    if ([cell isKindOfClass:[ZTTableViewCell class]]) {
        [(ZTTableViewCell *) cell setItem:object];
    }
    
    [self tableView:tableView cell:cell willAppearAtIndexPath:indexPath];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (id)tableView:(UITableView *)tableView objectForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < _items.count) {
        return [_items objectAtIndex:indexPath.row];
    } else {
        return nil;
    }
}

- (Class)tableView:(UITableView *)tableView cellClassForObject:(id)object{
    if ([object isKindOfClass:[ZTBaseItem class]]) {
        return [ZTTableViewCell class];
    }
    return [ZTTableViewCell class];
}

- (NSIndexPath *)tableView:(UITableView *)tableView indexPathForObject:(id)object{
    return nil;
}

- (void)tableView:(UITableView *)tableView cell:(UITableViewCell *)cell willAppearAtIndexPath:(NSIndexPath *)indexPath{
    
}
@end
