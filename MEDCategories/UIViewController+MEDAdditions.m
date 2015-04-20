//
//  UIViewController+MEDAdditions.m
//  MEDCategoriesDemo
//
//  Created by Khoa Pham on 3/19/15.
//  Copyright (c) 2015 2359Media. All rights reserved.
//

#import "UIViewController+MEDAdditions.h"
#import <Masonry.h>
#import "NSObject+MEDAdditions.h"

@implementation UIViewController (MEDAdditions)

+ (instancetype)med_instantiateFromStoryboardNamed:(NSString *)name {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:[self med_className]];
}

- (void)med_addChildViewController:(UIViewController *)childVC containerView:(UIView *)containerView {
    [self addChildViewController:childVC];
    [containerView addSubview:childVC.view];

    [childVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(containerView);
    }];

    [childVC didMoveToParentViewController:self];
}

- (void)med_removeFromParentViewController {
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

@end
