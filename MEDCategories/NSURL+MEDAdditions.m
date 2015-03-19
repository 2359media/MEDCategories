//
//  NSURL+MEDAdditions.m
//  MEDCategoriesDemo
//
//  Created by Khoa Pham on 3/19/15.
//  Copyright (c) 2015 2359Media. All rights reserved.
//

#import "NSURL+MEDAdditions.h"

@implementation NSURL (MEDAdditions)

- (NSString *)med_toString {
    return self.absoluteString;
}

@end
