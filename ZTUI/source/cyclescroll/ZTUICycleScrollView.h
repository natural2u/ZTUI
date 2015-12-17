//
//  ZTUICycleScrollView.h
//
//  Created by MaPengzhen on 15-8-18.
//  Copyright (c) 2015年 MaPengzhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZTPageControlExt.h"
@protocol ZTUICycleScrollViewDelegate;
@protocol ZTUICycleScrollViewDataSource;
@class ZTUICycleScrollSubView;

@interface ZTUICycleScrollView : UIView <UIScrollViewDelegate> {
    UIScrollView *_scrollView;
    ZTPageControlExt *_pageControl;

    NSInteger _totalPages;
    NSInteger _curPage;

    NSMutableArray *_curViews;

    //里面的每一个值是一个数组
    NSCache *_cacheDict;

    BOOL _animating;
}

@property(nonatomic, readonly) UIScrollView *scrollView;
@property(nonatomic, readonly) ZTPageControlExt *pageControl;
@property(nonatomic, assign) NSInteger currentPage;
@property(nonatomic, weak, setter = setDataSource:) id <ZTUICycleScrollViewDataSource> dataSource;
@property(nonatomic, weak, setter = setDelegate:) id <ZTUICycleScrollViewDelegate> delegate;
@property(nonatomic, strong) NSCache *cacheDict;
@property(nonatomic) BOOL animating;

- (void)reloadData;

- (void)setViewContent:(UIView *)view atIndex:(NSInteger)index;

- (void)setCenterPageIndex:(NSUInteger)index oldIndex:(NSUInteger)oldIndex animated:(BOOL)animate;

- (UIView *)dequeueReusablePage:(NSString *)reusableIdentifier;
@end

@protocol ZTUICycleScrollViewDelegate <NSObject>

@optional
- (void)cycleScrollView:(ZTUICycleScrollView *)scrollView didClickPageAtIndex:(NSInteger)index;

- (void)cycleScrollViewWillBeginDragging:(ZTUICycleScrollView *)scrollView;

- (void)cycleScrollViewDidEndDragging:(ZTUICycleScrollView *)scrollView willDecelerate:(BOOL)willDecelerate;
@end

@protocol ZTUICycleScrollViewDataSource <NSObject>

@required
- (NSInteger)numberOfPagesInScrollView:(ZTUICycleScrollView *)scrollView;

- (ZTUICycleScrollSubView *)scrollView:(ZTUICycleScrollView *)scrollView pageAtIndex:(NSInteger)pageIndex;

@end
