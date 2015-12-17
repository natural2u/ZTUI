//
//  ZTScrollPageTopBar.h
//
//  Created by MaPengzhen on 15-8-18.
//  Copyright (c) 2015年 MaPengzhen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZTScrollPageTopBar;

@interface ZTScrollPageTopBarCell : UITableViewCell {
    NSObject *_item;
}
- (void)setObject:(NSObject *)obj;

+ (CGFloat)pageTopBar:(UITableView *)pageTopBar columnWidthForObject:(id)object;
@end
