//
//  ZTPageControlExt.m
//
//  Created by MaPengzhen on 15-8-18.
//  Copyright (c) 2015年 MaPengzhen. All rights reserved.
//



#import "ZTPageControlExt.h"
#import <QuartzCore/QuartzCore.h>

@implementation ZTPageControlExt {

}
@synthesize activeImage = _activeImage;
@synthesize inactiveImage = _inactiveImage;


- (void)updateDots {
    if (_activeImage == nil) {
        return;
    }
    for (int i = 0; i < [self.subviews count]; i++) {
        UIImageView *dot = [self.subviews objectAtIndex:i];
        if ([dot isKindOfClass:[UIImageView class]]) {
            if (i == self.currentPage) dot.image = _activeImage;
            else dot.image = _inactiveImage;
        } else { 
            if (i == self.currentPage) {
                dot.layer.contents = (id)_activeImage.CGImage;
            } else {
                dot.layer.contents = (id)_inactiveImage.CGImage;
            } 
        }
    }
}

- (void)setCurrentPage:(NSInteger)page {
    [super setCurrentPage:page];
    [self updateDots];
}

- (void)dealloc { 
}
@end