//
//  BiscuitForward.m
//  BiscuitUIDemo
//
//  Created by tuan800_AAA on 15/11/4.
//  Copyright © 2015年 FingerBiscuit. All rights reserved.
//

#import "ZTForward.h"
#import "ZTBaseViewController.h"
#import "ZTNavigationViewController.h"

NSString *const ZTForwardSegueSplitCharacter = @"@";
NSString *const ZTForwardSegueIdentifierKey = @"SegueIdentifierKey";
NSString *const ZTForwardSeguePresentMode = @"forwardPresentMode";

@implementation ZTForward

+ (instancetype)sharedForward{
    static ZTForward *forward = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        forward = [[ZTForward alloc] init];
    });
    return forward;
}

+ (id)loadViewControllerFromStoryboard:(NSString *)storyboardName classIdentifier:(NSString *)classIdentifier {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
    ZTBaseViewController *vc = nil;
    if (classIdentifier&&[classIdentifier isKindOfClass:[NSString class]]&&classIdentifier.length>0) {
        vc = [storyboard instantiateViewControllerWithIdentifier:classIdentifier];
    } else {
        vc = [storyboard instantiateInitialViewController];
    }
    return vc;
}

+ (BOOL)forwardTo:(NSDictionary *)params sourceController:(UIViewController *)sourceViewController animated:(BOOL)animated{
    NSString *pIdentifier = params[ZTForwardSegueIdentifierKey];
    
    NSRange range = [pIdentifier rangeOfString:ZTForwardSegueSplitCharacter];
    NSString *storyboardName = pIdentifier;
    NSString *classIdentifier = pIdentifier;
    
    BOOL useClassIdentifier = NO;
    if (range.length > 0) {
        NSArray *arr = [pIdentifier componentsSeparatedByString:ZTForwardSegueSplitCharacter];
        if (arr.count == 2) {
            storyboardName = arr[0];
            classIdentifier = arr[1];
            useClassIdentifier = YES;
        }
    }
    
    UIViewController *current = sourceViewController;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
    id vc = nil;
    if (useClassIdentifier) {
        vc = [storyboard instantiateViewControllerWithIdentifier:classIdentifier];
    } else {
        vc = [storyboard instantiateInitialViewController];
    }
    
    
    if ([vc isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *) vc;
        NSArray *viewControllers = nav.viewControllers;
        if (viewControllers.count > 0) {
            ZTBaseViewController *viewCTL = viewControllers[0];
            [viewCTL setParameters:params];
        }
    } else {
        [vc setParameters:params];
    }
    
    NSString *modelKey = params[ZTForwardSeguePresentMode];
    BOOL isModelCTL = NO;
    if (modelKey) {
        isModelCTL = [modelKey boolValue];
    }
    
    if (isModelCTL) {
        ZTBaseViewController *vc2 = vc;
        UINavigationController *nav = vc2.navigationController;
        if (!nav) {
            nav = [[ZTNavigationViewController alloc] initWithRootViewController:vc];
        }
        [current presentViewController:nav animated:YES completion:^{
        }];
    } else {
        if ([current isKindOfClass:[UINavigationController class]]) {
            UINavigationController *uc = (UINavigationController *) current;
            if ([vc isKindOfClass:[UINavigationController class]]) {
                UINavigationController *uCTL = (UINavigationController *) vc;
                UIViewController *sCTL = [uCTL topViewController];
                [uc pushViewController:sCTL animated:animated];
            } else {
                [uc pushViewController:vc animated:animated];
            }
        } else {
            if ([vc isKindOfClass:[UINavigationController class]]) {
                UINavigationController *nav = (UINavigationController *) vc;
                NSArray *viewControllers = nav.viewControllers;
                if (viewControllers.count > 0) {
                    vc = viewControllers[0];
                    ZTBaseViewController *vc2 = vc;
                    [vc2 setParameters:params];
                }
            }
            [current.navigationController pushViewController:vc animated:animated];
        }
    }
    return YES;
}
@end
