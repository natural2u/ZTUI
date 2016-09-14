//
//  ZTBaseViewController.h
//
//  Created by 马成林 on 15/8/17.
//  Copyright (c) 2015年 ___MaPengzhen___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewConvenience.h"
#import "ZTBaseModel.h"
@interface ZTBaseViewController : UIViewController
@property (nonatomic,strong) ZTBaseModel *_Nullable model;

/**
 *  controller之间传递参数
 *
 *  @param parameters
 */
- (void) setParameters:(NSDictionary *_Nullable) parameters;

- (void)loadData;

/**
 *  处理请求成功的数据，子类可实现重写
 *
 *  @param responseObject 请求返回的数据
 */
- (void)dealReceivedData:(id _Nullable)responseObject;

/**
 *  处理请求失败的错误，子类可实现重写
 *
 *  @param error 请求失败的错误
 */
- (void)dealError:(NSError *_Nullable)error;

/**
 * The view has appeared at least once and hasn't been removed due to a memory warning.
 */
@property (nonatomic, readonly) BOOL hasViewAppeared;

/**
 * The view is about to appear and has not appeared yet.
 */
@property (nonatomic, readonly) BOOL isViewAppearing;


/**
 * Determines if the view will be resized automatically to fit the keyboard.
 */

@property (nonatomic) BOOL autoresizesForKeyboard;
/**
 * Sent to the controller before the keyboard slides in.
 */
- (void)keyboardWillAppear:(BOOL)animated withBounds:(CGRect)bounds;

/**
 * Sent to the controller before the keyboard slides out.
 */
- (void)keyboardWillDisappear:(BOOL)animated withBounds:(CGRect)bounds;

/**
 * Sent to the controller after the keyboard has slid in.
 */
- (void)keyboardDidAppear:(BOOL)animated withBounds:(CGRect)bounds;

/**
 * Sent to the controller after the keyboard has slid out.
 */
- (void)keyboardDidDisappear:(BOOL)animated withBounds:(CGRect)bounds;
@end
