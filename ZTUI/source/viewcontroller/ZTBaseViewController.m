//
//  ZTBaseViewController.m
//
//  Created by 马成林 on 15/8/17.
//  Copyright (c) 2015年 ___MaPengzhen___. All rights reserved.
//

#import "ZTBaseViewController.h"
#import "ZTForward.h"
@interface ZTBaseViewController (){
    UIStatusBarStyle _previousStatusBarStyle;
}

@end

@implementation ZTBaseViewController

- (void)setParameters:(NSDictionary *)parameters{

}
#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _previousStatusBarStyle = [UIApplication sharedApplication].statusBarStyle;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [ZTForward sharedForward].visibleViewController = self;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarStyle = _previousStatusBarStyle;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - load data
- (void)loadData{
    
}

#pragma mark - handle data,override by subclass
- (void)dealResponseWithDataTask:(NSURLSessionDataTask *)response responseObject:(id)responseObject error:(NSError *)error{
    
}

- (void)dealReceivedData:(id)responseObject{
    
}

- (void)dealError:(NSError *)error{
    
}

@end
