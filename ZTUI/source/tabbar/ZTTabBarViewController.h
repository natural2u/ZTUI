//
//  ZTTabBarViewController.h
//
//  Created by tuan800_AAA on 15/11/4.
//  Copyright © 2015年 FingerBiscuit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTTabBarViewController : UITabBarController

@property (nonatomic,retain)UIColor *barTintcolor;

- (void)setTitles:(NSArray *)titles itemImages:(NSArray *)images itemSelectedImage:(NSArray *)selectedImages;

@end
