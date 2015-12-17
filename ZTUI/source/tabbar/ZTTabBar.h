//
//  ZTTabBar.h
//  Pods
//
//  Created by 马成林 on 15/11/4.
//
//

#import <UIKit/UIKit.h>

@interface ZTTabBar : UITabBar
- (instancetype)initWithFrame:(CGRect)frame itemTitles:(NSArray *)titles itemImages:(NSArray *)images itemSelectedImage:(NSArray *)selectedImages;

- (void)setTitles:(NSArray *)titles itemImages:(NSArray *)images itemSelectedImage:(NSArray *)selectedImages;
@end
