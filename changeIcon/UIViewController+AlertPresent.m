//
//  UIViewController+AlertPresent.m
//  changeIcon
//
//  Created by 王园园 on 2018/8/30.
//  Copyright © 2018年 dfs. All rights reserved.
//

#import "UIViewController+AlertPresent.h"
#import <objc/runtime.h>
@implementation UIViewController (AlertPresent)

+ (void)load {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method presentM = class_getInstanceMethod(self.class, @selector(presentViewController:animated:completion:));
        Method presentSwizzlingM = class_getInstanceMethod(self.class, @selector(lq_presentViewController:animated:completion:));

        method_exchangeImplementations(presentM, presentSwizzlingM);
    });
}

- (void)lq_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {

    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
        UIAlertController *alertController = (UIAlertController *)viewControllerToPresent;
        if (alertController.title == nil && alertController.message == nil) {
            return;
        }
    }

    [self lq_presentViewController:viewControllerToPresent animated:flag completion:completion];
}

@end
