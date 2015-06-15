//
//  UIView+MEDAdditions.m
//  MEDCategoriesDemo
//
//  Created by Khoa Pham on 3/19/15.
//  Copyright (c) 2015 2359Media. All rights reserved.
//

#import "UIView+MEDAdditions.h"
#import "NSObject+MEDAdditions.h"

@implementation UIView (MEDAdditions)

+ (UINib *)med_nib {
    return [UINib nibWithNibName:[self med_className] bundle:nil];
}

- (UIImage *)med_toImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    
    if (![self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO]) {
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

@end
