//
//  UIImage+MEDAdditons.h
//  MEDCategoriesDemo
//
//  Created by Vinh Nguyen on 25/03/2015.
//  Copyright (c) Năm 2015 2359Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MEDAdditons)

+ (UIImage *)med_imageWithImage:(UIImage *)image scaledToSize:(CGSize)size;
+ (UIImage *)med_imageWithImage:(UIImage *)image scaledToMaxWidth:(CGFloat)width maxHeight:(CGFloat)height;

@end
