//
//  NSObject+MEDAdditions.m
//  MEDCategoriesDemo
//
//  Created by Khoa Pham on 3/19/15.
//  Copyright (c) 2015 2359Media. All rights reserved.
//

#import "NSObject+MEDAdditions.h"

@implementation NSObject (MEDAdditions)

+ (NSString *)med_className {
    return NSStringFromClass(self);
}

- (NSString *)med_className {
    return [[self class] med_className];
}

@end
