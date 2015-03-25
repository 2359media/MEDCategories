//
//  NSArray+MEDAdditions.m
//  MEDCategoriesDemo
//
//  Created by Vinh Nguyen on 25/03/2015.
//  Copyright (c) Năm 2015 2359Media. All rights reserved.
//

#import "NSArray+MEDAdditions.h"

@implementation NSArray (MEDAdditions)

#pragma mark - Unique

- (NSArray *)med_uniqueElements
{
    return [self med_uniqueElementsWithKey:@"self"];
}

- (NSArray *)med_uniqueElementsWithKey:(NSString *)key
{
    NSString *distinctKeyPath = [NSString stringWithFormat:@"@distinctUnionOfObjects.%@", key];
    return [self valueForKeyPath:distinctKeyPath];
}

#pragma mark - Sort

- (NSArray *)med_arraySortedByKey:(NSString *)key ascending:(BOOL)ascending
{
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:key
                                        ascending:ascending
                                        selector:@selector(localizedCaseInsensitiveCompare:)];
    return [self sortedArrayUsingDescriptors:@[sortDescriptor]];
}

#pragma mark - Compare

- (NSArray *)med_localizedCompare
{
    return [self sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}

- (NSArray *)med_compare
{
    return [self sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

@end
