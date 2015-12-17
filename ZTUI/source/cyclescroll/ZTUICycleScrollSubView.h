//
//  ZTUICycleScrollSubView.h
//
//  Created by MaPengzhen on 15-8-18.
//  Copyright (c) 2015年 MaPengzhen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTUICycleScrollSubView : UIView {
     NSString *_reuseIdentifier;
}
@property(nonatomic, copy) NSString *reuseIdentifier;


- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)identifier;
@end
