//
//  ZTUICycleScrollSubView.m
//
//  Created by MaPengzhen on 15-8-18.
//  Copyright (c) 2015年 MaPengzhen. All rights reserved.
//

#import "ZTUICycleScrollSubView.h"

@implementation ZTUICycleScrollSubView
@synthesize reuseIdentifier = _reuseIdentifier;

- (void) initContent {
    self.reuseIdentifier = @"circleScrollView";
    
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initContent];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)identifier {
    self = [super initWithFrame:frame];
    if (self) {
        [self initContent];
        self.reuseIdentifier = identifier;
    }
    return self;
}

- (void)dealloc {
 
}

@end
