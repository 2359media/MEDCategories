//
//  UIViewController+MEDAdditions.m
//  MEDCategoriesDemo
//
//  Created by Khoa Pham on 3/19/15.
//  Copyright (c) 2015 2359Media. All rights reserved.
//

#import "UIViewController+MEDAdditions.h"

@implementation UIViewController (MEDAdditions)

- (void)med_addChildViewController:(UIViewController *)childVC containerView:(UIView *)containerView {
    [self addChildViewController:childVC];
    [containerView addSubview:childVC.view];
    [childVC didMoveToParentViewController:self];
}

- (void)med_removeFromParentViewController {
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

@end
