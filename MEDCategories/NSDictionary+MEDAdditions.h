//
//  NSDictionary+MEDAdditions.h
//  Pods
//
//  Created by Khoa Pham on 5/20/15.
//
//

@import Foundation;

@interface NSDictionary (MEDAdditions)

#pragma mark - Validation
- (id)med_safeObjectForKey:(NSString *)key;
- (NSString *)med_stringForKey:(NSString *)key;
- (NSString *)med_stringOrEmptyStringForKey:(NSString *)key;
- (NSDictionary *)med_dictionaryForKey:(NSString *)key;
- (NSArray *)med_arrayForKey:(NSString *)key;
- (NSNumber *)med_numberForKey:(NSString *)key;
- (NSURL *)med_urlForKey:(NSString *)key;
- (BOOL)med_boolForKey:(NSString *)key;

#pragma mark - Manipulation
- (NSDictionary *)med_dictionaryByAddingEntriesFromDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)med_dictionaryByRemovingEntriesWithKeys:(NSSet *)keys;
- (NSArray *)med_sortedKeysUsingComparator:(NSComparator)comparator;
- (NSArray *)med_sortedValuesUsingKeyComparator:(NSComparator)comparator;
- (void)med_enumerateSortedKeysAndObjectsUsingComparator:(NSComparator)comparator usingBlock:(void (^)(id key, id value, BOOL *stop))block;

#pragma mark - RX
- (void)med_each:(void (^)(id k, id v))block;
- (void)med_eachKey:(void (^)(id k))block;
- (void)med_eachValue:(void (^)(id v))block;
- (NSArray *)med_map:(id (^)(id key, id value))block;
- (BOOL)med_hasKey:(id)key;
- (NSDictionary *)med_pick:(NSArray *)keys;
- (NSDictionary *)med_omit:(NSArray *)key;
+ (NSDictionary *)med_flatten:(NSArray *)arrayOfDictionaries;

@end
