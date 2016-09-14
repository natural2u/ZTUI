//
//  ZTBaseViewController.m
//
//  Created by 马成林 on 15/8/17.
//  Copyright (c) 2015年 ___MaPengzhen___. All rights reserved.
//

#import "ZTBaseViewController.h"
#import "ZTForward.h"
#import "ZTCommonFunction.h"

@interface ZTBaseViewController (){
    UIStatusBarStyle _previousStatusBarStyle;
}

@end

@implementation ZTBaseViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.autoresizesForKeyboard = NO;
        _hasViewAppeared = NO;
        _isViewAppearing = NO;
    }
    return self;
}

- (void)dealloc
{
    self.autoresizesForKeyboard = NO;
    ZTRemoveObserver(self);
}

- (void)setParameters:(NSDictionary *)parameters{

}

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _isViewAppearing = YES;
    _previousStatusBarStyle = [UIApplication sharedApplication].statusBarStyle;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    _hasViewAppeared = YES;
    [ZTForward sharedForward].visibleViewController = self;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarStyle = _previousStatusBarStyle;
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    _isViewAppearing = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - load data
- (void)loadData{
    
}

#pragma mark - handle data,override by subclass

- (void)dealReceivedData:(id)responseObject{
    
}

- (void)dealError:(NSError *)error{
    
}

#pragma mark -UIKeyboardNotifications

- (void)setAutoresizesForKeyboard:(BOOL)autoresizesForKeyboard{
    _autoresizesForKeyboard = autoresizesForKeyboard;
    if (_autoresizesForKeyboard) {
        ZTAddObserver(self, @selector(keyboardWillShow:), UIKeyboardWillShowNotification, nil);
        ZTAddObserver(self, @selector(keyboardWillHide:), UIKeyboardWillHideNotification, nil);
        ZTAddObserver(self, @selector(keyboardDidShow:), UIKeyboardDidShowNotification, nil);
        ZTAddObserver(self, @selector(keyboardDidHide:), UIKeyboardDidHideNotification, nil);
        
    }else{
        ZTRemoveNotifyForObserver(self, UIKeyboardWillShowNotification);
        ZTRemoveNotifyForObserver(self, UIKeyboardWillHideNotification);
        ZTRemoveNotifyForObserver(self, UIKeyboardDidShowNotification);
        ZTRemoveNotifyForObserver(self, UIKeyboardDidHideNotification);

    }
}

- (void)resizeForKeyboard:(NSNotification*)notification appearing:(BOOL)appearing{
    CGRect keyboardBounds;
    
    CGFloat keyboardStart;
    CGRect startFrame;
    [[notification.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] getValue:&startFrame];
    keyboardStart = CGRectGetMinY(startFrame);
    
    CGFloat keyboardEnd;
    CGRect endFrame;
    [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&endFrame];
    keyboardEnd = CGRectGetMinY(endFrame);
    
    CGFloat duration;
    [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&duration];
    BOOL animated = keyboardStart != keyboardEnd;
    if (animated) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:duration];
    }
    
    if (appearing) {
        [self keyboardWillAppear:animated withBounds:keyboardBounds];
    } else {
        [self keyboardDidDisappear:animated withBounds:keyboardBounds];
    }
    
    if (animated) {
        [UIView commitAnimations];
    }
}

- (void)keyboardWillShow:(NSNotification*)notification {
    if (self.isViewAppearing) {
        [self resizeForKeyboard:notification appearing:YES];
    }
}

- (void)keyboardDidShow:(NSNotification*)notification {
    CGRect frameStart;
    [[notification.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] getValue:&frameStart];
    
    CGRect keyboardBounds = CGRectMake(0, 0, frameStart.size.width, frameStart.size.height);
    
    [self keyboardDidAppear:YES withBounds:keyboardBounds];
}

- (void)keyboardDidHide:(NSNotification*)notification {
    if (self.isViewAppearing) {
        [self resizeForKeyboard:notification appearing:NO];
    }
}

- (void)keyboardWillHide:(NSNotification*)notification {
    CGRect frameEnd;
    [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&frameEnd];
    
    CGRect keyboardBounds = CGRectMake(0, 0, frameEnd.size.width, frameEnd.size.height);
    
    [self keyboardWillDisappear:YES withBounds:keyboardBounds];
}

- (void)keyboardWillAppear:(BOOL)animated withBounds:(CGRect)bounds {
    // Empty default implementation.
}

- (void)keyboardWillDisappear:(BOOL)animated withBounds:(CGRect)bounds {
    // Empty default implementation.
}

- (void)keyboardDidAppear:(BOOL)animated withBounds:(CGRect)bounds {
    // Empty default implementation.
}

- (void)keyboardDidDisappear:(BOOL)animated withBounds:(CGRect)bounds {
    // Empty default implementation.
}


@end
