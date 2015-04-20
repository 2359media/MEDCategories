//
//  UINavigationController+MEDAdditions.m
//  MEDCategoriesDemo
//
//  Created by Vinh Nguyen on 25/03/2015.
//  Copyright (c) Năm 2015 2359Media. All rights reserved.
//

#import "UINavigationController+MEDAdditions.h"

@implementation UINavigationController (MEDAdditions)

// NOTE: based on https://gist.github.com/snikch/3661188

+ (UIViewController *)med_topMostViewController
{
    return [self med_topViewControllerFromRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

+ (UIViewController *)med_topViewControllerFromRootViewController:(UIViewController *)rootViewController
{
    if (rootViewController.presentedViewController == nil) {
        return rootViewController;
    }

    if ([rootViewController.presentedViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController.presentedViewController;
        UIViewController *lastViewController = [[navigationController viewControllers] lastObject];
        return [self med_topViewControllerFromRootViewController:lastViewController];
    }

    UIViewController *presentedViewController = (UIViewController *)rootViewController.presentedViewController;
    return [self med_topViewControllerFromRootViewController:presentedViewController];
}

@end
