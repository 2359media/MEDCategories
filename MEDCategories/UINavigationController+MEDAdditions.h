//
//  UINavigationController+MEDAdditions.h
//  MEDCategoriesDemo
//
//  Created by Vinh Nguyen on 25/03/2015.
//  Copyright (c) Năm 2015 2359Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (MEDAdditions)

// Find the top most view controller from presenting navigation controller stack
// may be useful in case of showing pop up in an arbitrary view controller
+ (UIViewController *)med_topMostViewController;
+ (UIViewController *)med_topViewControllerFromRootViewController:(UIViewController *)rootViewController;

@end
