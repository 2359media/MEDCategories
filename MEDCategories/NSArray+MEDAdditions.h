//
//  NSArray+MEDAdditions.h
//  MEDCategoriesDemo
//
//  Created by Vinh Nguyen on 25/03/2015.
//  Copyright (c) Năm 2015 2359Media. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (MEDAdditions)

// unique
- (NSArray *)med_uniqueElements;
- (NSArray *)med_uniqueElementsWithKey:(NSString *)key;

// sort
- (NSArray *)med_arraySortedByKey:(NSString *)key ascending:(BOOL)ascending;

// compare
- (NSArray *)med_compare;
- (NSArray *)med_localizedCompare;

#pragma mark - RX
- (void)med_each:(void (^)(id object))block;
- (void)med_eachWithIndex:(void (^)(id object, NSUInteger index))block;
- (NSArray *)med_map:(id (^)(id object))block;
- (NSArray *)med_filter:(BOOL (^)(id object))block;
- (NSArray *)med_reject:(BOOL (^)(id object))block;
- (id)med_detect:(BOOL (^)(id object))block;

@end
