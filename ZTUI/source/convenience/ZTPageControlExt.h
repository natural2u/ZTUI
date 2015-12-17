//
//  ZTPageControlExt.h
//
//  Created by MaPengzhen on 15-8-18.
//  Copyright (c) 2015年 MaPengzhen. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZTPageControlExt : UIPageControl{
    UIImage *_activeImage;
    UIImage *_inactiveImage;
}
@property(nonatomic, strong) UIImage *activeImage;
@property(nonatomic, strong) UIImage *inactiveImage;


@end