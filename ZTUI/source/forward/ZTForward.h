//
//  ZTForward.h
//  ZTUIDemo
//
//  Created by tuan800_AAA on 15/11/4.
//  Copyright © 2015年 FingerBiscuit. All rights reserved.
//

#import <UIKit/UIKit.h>
extern NSString *const ZTForwardSegueIdentifierKey;
extern NSString *const ZTForwardSegueSplitCharacter;
extern NSString *const ZTForwardSeguePresentMode;

@interface ZTForward : NSObject

@property(nonatomic,assign)UIViewController *appRootViewController;
@property(nonatomic,assign)UIViewController *visibleViewController;

+ (instancetype)sharedForward;

+ (id)loadViewControllerFromStoryboard:(NSString *)storyboardName classIdentifier:(NSString *)classIdentifier;

+ (BOOL)forwardTo:(NSDictionary *)params
 sourceController:(UIViewController *)sourceViewController animated:(BOOL)animated;
@end
