//
//  NSString+MEDAdditions.m
//  MEDCategoriesDemo
//
//  Created by Khoa Pham on 3/19/15.
//  Copyright (c) 2015 2359Media. All rights reserved.
//

#import "NSString+MEDAdditions.h"

@implementation NSString (MEDAdditions)

- (NSURL *)med_toURL {
    return [NSURL URLWithString:self];
}

@end
