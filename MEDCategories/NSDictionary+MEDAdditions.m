//
//  NSDictionary+MEDAdditions.m
//  Pods
//
//  Created by Khoa Pham on 5/20/15.
//
//

#import "NSDictionary+MEDAdditions.h"

@implementation NSDictionary (MEDAdditions)

#pragma mark - Manipulation
- (NSDictionary *)med_dictionaryByAddingEntriesFromDictionary:(NSDictionary *)dictionary {
    NSMutableDictionary *result = [self mutableCopy];
    [result addEntriesFromDictionary:dictionary];
    return result;
}

- (NSDictionary *)med_dictionaryByRemovingEntriesWithKeys:(NSSet *)keys {
    NSMutableDictionary *result = [self mutableCopy];
    [result removeObjectsForKeys:keys.allObjects];
    return result;
}

#pragma mark - RX
- (void)med_each:(void (^)(id k, id v))block {
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        block(key, obj);
    }];
}

- (void)med_eachKey:(void (^)(id k))block {
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        block(key);
    }];
}

- (void)med_eachValue:(void (^)(id v))block {
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        block(obj);
    }];
}

- (NSArray *)med_map:(id (^)(id key, id value))block {
    NSMutableArray *array = [NSMutableArray array];

    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        id object = block(key, obj);
        if (object) {
            [array addObject:object];
        }
    }];

    return array;
}

- (BOOL)med_hasKey:(id)key {
    return !!self[key];
}

- (NSDictionary *)med_pick:(NSArray *)keys {
    NSMutableDictionary *picked = [[NSMutableDictionary alloc] initWithCapacity:keys.count];

    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([keys containsObject:key]) {
            picked[key] = obj;
        }
    }];

    return picked;
}

- (NSDictionary *)med_omit:(NSArray *)keys {
    NSMutableDictionary *omitted = [[NSMutableDictionary alloc] initWithCapacity:([self allKeys].count - keys.count)];

    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (![keys containsObject:key]) {
            omitted[key] = obj;
        }
    }];

    return omitted;
}

- (NSArray *)med_sortedKeysUsingComparator:(NSComparator)comparator
{
    return [self.allKeys sortedArrayUsingComparator:comparator];
}

- (NSArray *)med_sortedValuesUsingKeyComparator:(NSComparator)comparator
{
    NSMutableArray *returnValues = [NSMutableArray new];
    [self med_enumerateSortedKeysAndObjectsUsingComparator:comparator usingBlock:^(id key, id value, BOOL *stop) {
        [returnValues addObject:value];
    }];
    
    return [returnValues copy];
}

- (void)med_enumerateSortedKeysAndObjectsUsingComparator:(NSComparator)comparator
                                              usingBlock:(void (^)(id key, id value, BOOL *stop))block
{
    NSArray *sortedKeys = [self med_sortedKeysUsingComparator:comparator];
    [sortedKeys enumerateObjectsUsingBlock:^(id key, NSUInteger idx, BOOL *stop) {
        id value = [self objectForKey:key];
        block(key, value, stop);
    }];
}

@end
