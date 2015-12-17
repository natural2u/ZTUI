//
//  ZTScrollPageTopBar.h
//
//  Created by MaPengzhen on 15-8-18.
//  Copyright (c) 2015年 MaPengzhen. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ZTScrollPageTopBarDelegate <NSObject>
- (void)didSelectItemAtIndex:(NSIndexPath *)indexPath;
@end

@interface ZTScrollPageTopBar : UITableView <UITableViewDelegate>{
    NSInteger _selectedIndex;
}
@property(nonatomic, weak) id <ZTScrollPageTopBarDelegate> barDelegate;
@property(nonatomic) NSInteger selectedIndex;

- (void)selectItem:(NSInteger)index;
@end
