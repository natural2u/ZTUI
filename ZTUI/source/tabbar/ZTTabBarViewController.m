//
//  ZTTabBarViewController.m
//
//  Created by tuan800_AAA on 15/11/4.
//  Copyright © 2015年 FingerBiscuit. All rights reserved.
//

#import "ZTTabBarViewController.h"
#import "ZTTabBar.h"

@interface ZTTabBarViewController ()<UITabBarDelegate>{
    ZTTabBar *_customBar;
}

@end

@implementation ZTTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (_customBar) {
        _customBar.frame = self.tabBar.frame;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setTitles:(NSArray *)titles itemImages:(NSArray *)images itemSelectedImage:(NSArray *)selectedImages{
    if (!_customBar) {
        _customBar = [[ZTTabBar alloc] initWithFrame:self.tabBar.frame itemTitles:titles itemImages:images itemSelectedImage:selectedImages];
        _customBar.delegate = self;
        [self.view addSubview:_customBar];
    }else{
        [_customBar setTitles:titles itemImages:images itemSelectedImage:selectedImages];
    }
    _customBar.frame = self.tabBar.frame;
}

- (void)setBarTintcolor:(UIColor *)barTintcolor{
    _barTintcolor = barTintcolor;
    _customBar.tintColor = barTintcolor;
}

#pragma mark-UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    self.selectedIndex = item.tag;
}


@end
