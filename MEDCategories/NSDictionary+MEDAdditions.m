//
//  NSDictionary+MEDAdditions.m
//  Pods
//
//  Created by Khoa Pham on 5/20/15.
//
//

#import "NSDictionary+MEDAdditions.h"

@implementation NSDictionary (MEDAdditions)

- (id)med_safeObjectForKey:(NSString *)key
{
    id safeObject = self[key];
    if (!safeObject || [safeObject isKindOfClass:[NSNull class]]) {
        return nil;
    }

    return safeObject;
}

- (NSString *)med_stringForKey:(NSString *)key
{
    NSString *string = [self med_safeObjectForKey:key];
    if ([string isKindOfClass:[NSString class]] && [string length] > 0) {
        return string;
    }
    
    return nil;
}

- (NSString *)med_stringOrEmptyStringForKey:(NSString *)key
{
    NSString *string = [self med_stringForKey:key];
    if (!string) {
        return @"";
    }
    
    return nil;
}

- (NSDictionary *)med_dictionaryForKey:(NSString *)key
{
    NSDictionary *dictionary = [self med_safeObjectForKey:key];
    if ([dictionary isKindOfClass:[NSDictionary class]] && [[dictionary allKeys] count] > 0) {
        return dictionary;
    }
    
    return nil;
}

- (NSArray *)med_arrayForKey:(NSString *)key
{
    NSArray *array = [self med_safeObjectForKey:key];
    if ([array isKindOfClass:[NSArray class]] && [array count] > 0) {
        return [self med_safeObjectForKey:key];
    }
    
    return nil;
}

- (NSNumber *)med_numberForKey:(NSString *)key
{
    NSNumber *number = [self med_safeObjectForKey:key];
    if ([number isKindOfClass:[NSNumber class]]) {
        return number;
    }
    
    return nil;
}

- (NSURL *)med_urlForKey:(NSString *)key
{
    return [NSURL URLWithString:[self med_safeObjectForKey:key]];
}

- (BOOL)med_boolForKey:(NSString *)key
{
    return [[self med_safeObjectForKey:key] boolValue];
}

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

+ (NSDictionary *)med_flatten:(NSArray *)arrayOfDictionaries {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    for (NSDictionary *dictionary in arrayOfDictionaries) {
        [result addEntriesFromDictionary:dictionary];
    }

    return result;
}

@end
