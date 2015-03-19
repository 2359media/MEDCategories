//
//  UIViewController+MEDAdditions.h
//  MEDCategoriesDemo
//
//  Created by Khoa Pham on 3/19/15.
//  Copyright (c) 2015 2359Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (MEDAdditions)

- (void)med_addChildViewController:(UIViewController *)childVC containerView:(UIView *)containerView;
- (void)med_removeFromParentViewController;

@end
