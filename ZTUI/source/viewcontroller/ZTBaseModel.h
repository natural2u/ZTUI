//
//  ZTBaseModel.h
//  Pods
//
//  Created by 马成林 on 15/8/19.
//
//

#import <ZTNetwork/ZTService.h>
@interface ZTBaseModel : NSObject

/**
*  service 用于model中网络请求
*/
@property (nonatomic,strong) ZTService *service;

@end
