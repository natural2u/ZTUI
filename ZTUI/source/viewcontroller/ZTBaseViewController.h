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
 *  处理加载的数据，如果返回错误则responseObject=nil，如果请求成功则error=nil，子类可实现重写
 *
 *  @param response       NSURLSessionDataTask
 *  @param responseObject 请求返回的数据
 *  @param error          请求失败的错误
 */
- (void)dealResponseWithDataTask:(NSURLSessionDataTask *_Nullable) response responseObject:(id _Nullable)responseObject error:(NSError *_Nullable) error;

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

@end
