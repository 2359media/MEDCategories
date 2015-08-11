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
    if (!key || key.length == 0) {
        return @[];
    }

    NSString *distinctKeyPath = [NSString stringWithFormat:@"@distinctUnionOfObjects.%@", key];
    return [self valueForKeyPath:distinctKeyPath];
}

#pragma mark - Sort

- (NSArray *)med_arraySortedByKey:(NSString *)key ascending:(BOOL)ascending
{
    if (!key || key.length == 0) {
        return @[];
    }

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

- (NSArray *)med_reverse
{
    return [[self reverseObjectEnumerator] allObjects];
}

- (NSArray *)med_shuffle {
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:self];

    const NSUInteger count = self.count;
    for (NSUInteger i = 0; i < count - 1; ++i) {
        const NSUInteger n = arc4random_uniform((UInt32)count - i) + i;
        if (i != n) {
            [mutableArray exchangeObjectAtIndex:i withObjectAtIndex:n];
        }
    }

    return [NSArray arrayWithArray:mutableArray];
}

- (id)med_randomObject {
    NSUInteger count = self.count;
    if (count > 0) {
        return self[arc4random() % count];
    }
    
    return nil;
}

#pragma mark - Operator

- (NSInteger)med_sum
{
    return [[self valueForKeyPath:@"@sum.self"] integerValue];
}

#pragma mark - RX
- (void)med_each:(void (^)(id object))block {
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj);
    }];
}

- (void)med_eachWithIndex:(void (^)(id object, NSUInteger index))block {
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj, idx);
    }];
}

- (NSArray *)med_map:(id (^)(id object))block {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];

    for (id object in self) {
        [array addObject:block(object) ?: [NSNull null]];
    }

    return array;
}

- (NSArray *)med_filter:(BOOL (^)(id object))block {
    return [self filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return block(evaluatedObject);
    }]];
}

- (NSArray *)med_reject:(BOOL (^)(id object))block {
    return [self filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return !block(evaluatedObject);
    }]];
}

- (id)med_detect:(BOOL (^)(id object))block {
    for (id object in self) {
        if (block(object))
            return object;
    }
    return nil;
}

- (id)med_reduce:(id (^)(id accumulator, id object))block {
    return [self med_reduce:nil withBlock:block];
}

- (id)med_reduce:(id)initial withBlock:(id (^)(id accumulator, id object))block {
    id accumulator = initial;

    for(id object in self)
        accumulator = accumulator ? block(accumulator, object) : object;

    return accumulator;
}

- (NSArray *)med_minus:(NSArray *)anotherArray {
    NSMutableSet *set = [NSMutableSet setWithArray:self];
    NSSet *anotherSet = [NSSet setWithArray:anotherArray];

    [set minusSet:anotherSet];
    return [set allObjects];
}

- (NSArray *)med_uniques {
    return [[NSOrderedSet orderedSetWithArray:self] array];
}

+ (NSArray *)med_flatten:(NSArray *)arraysOfArray {
    NSMutableArray *results = [NSMutableArray array];
    for (NSArray *array in arraysOfArray) {
        [results addObjectsFromArray:array];
    }

    return results;
}

- (NSArray *)med_groupedBy:(NSInteger)number {
    if (number == 0) {
        return @[self];
    }

    NSMutableArray *results = [NSMutableArray array];

    NSInteger remainCount = self.count;
    NSInteger count = 0;

    while (count < self.count) {
        NSRange range = NSMakeRange(count, MIN(number, remainCount));

        NSArray *subArray = [self subarrayWithRange:range];
        [results addObject:subArray];

        remainCount -= range.length;
        count += range.length;
    }

    return results;
}

- (NSArray *)med_subarrayWithRange:(NSRange)range {
    if (range.location + range.length <= self.count) {
        return [self subarrayWithRange:range];
    }
    
    return nil;
}

@end
