//
//  ZTScrollPageView.m
//
//  Created by MaPengzhen on 15-8-18.
//  Copyright (c) 2015年 MaPengzhen. All rights reserved.
//

#import "ZTScrollPageView.h"

@implementation ZTScrollPageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.enableDragToRight = YES;
    }
    return self;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        UIPanGestureRecognizer *panGesture = (UIPanGestureRecognizer *) gestureRecognizer;
        
        CGFloat velocityX = [panGesture velocityInView:self.superview].x;

        if ( velocityX > 0) {//在向右拽
            if (self.contentOffset.x==0 && !self.enableDragToRight) {
                return NO;
            }
        } else {
            CGFloat xWidth = self.contentSize.width - self.frame.size.width;
            if (self.contentOffset.x >= xWidth && !self.enableDragToRight) { 
                return NO;
            }
        }
    }
    return YES;
}
@end
