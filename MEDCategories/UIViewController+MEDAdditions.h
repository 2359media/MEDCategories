//
//  UIViewController+MEDAdditions.h
//  MEDCategoriesDemo
//
//  Created by Khoa Pham on 3/19/15.
//  Copyright (c) 2015 2359Media. All rights reserved.
//

@import UIKit;

@interface UIViewController (MEDAdditions)

+ (instancetype)med_instantiateFromStoryboardNamed:(NSString *)name;
+ (instancetype)med_instantiateFromDeviceStoryboardNamed:(NSString *)name;

- (void)med_addChildViewController:(UIViewController *)childVC containerView:(UIView *)containerView;
- (void)med_removeFromParentViewController;

@end
