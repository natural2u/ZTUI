//
//  ZTTabBar.m
//  Pods
//
//  Created by 马成林 on 15/11/4.
//
//

#import "ZTTabBar.h"

@implementation ZTTabBar
- (instancetype)initWithFrame:(CGRect)frame itemTitles:(NSArray *)titles itemImages:(NSArray *)images itemSelectedImage:(NSArray *)selectedImages
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitles:titles itemImages:images itemSelectedImage:selectedImages];
    }
    return self;
}

- (void)setTitles:(NSArray *)titles itemImages:(NSArray *)images itemSelectedImage:(NSArray *)selectedImages{
    if (titles.count!=images.count||images.count!=selectedImages.count||selectedImages.count!=titles.count) {
        return;
    }
    NSMutableArray *items = [NSMutableArray array];
    for (int i=0; i<titles.count; i++) {
        UIImage *image = nil;
        UIImage *selectImage = nil;
        if ([images[i] isKindOfClass:[NSString class]]) {
            image = [UIImage imageNamed:images[i]];
        }else if([images[i] isKindOfClass:[UIImage class]]){
            image = images[i];
        }else{
            return;
        }
        if ([selectedImages[i] isKindOfClass:[NSString class]]) {
            selectImage = [UIImage imageNamed:selectedImages[i]];
        }else if([selectedImages[i] isKindOfClass:[UIImage class]]){
            selectImage = selectedImages[i];
        }else{
            return;
        }
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:titles[i] image:image selectedImage:selectImage];
        item.tag = i;
        item.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        item.titlePositionAdjustment = UIOffsetMake(0, -6);
        [items addObject:item];
    }
    [self setItems:items animated:NO];
    [self setSelectedItem:items[0]];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
