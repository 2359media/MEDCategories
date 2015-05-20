//
//  NSDictionary+MEDAdditions.h
//  Pods
//
//  Created by Khoa Pham on 5/20/15.
//
//

#import <Foundation/Foundation.h>

@interface NSDictionary (MEDAdditions)

#pragma mark - Manipulation
- (NSDictionary *)med_dictionaryByAddingEntriesFromDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)med_dictionaryByRemovingEntriesWithKeys:(NSSet *)keys;

#pragma mark - RX
- (void)med_each:(void (^)(id k, id v))block;
- (void)med_eachKey:(void (^)(id k))block;
- (void)med_eachValue:(void (^)(id v))block;
- (NSArray *)med_map:(id (^)(id key, id value))block;
- (BOOL)med_hasKey:(id)key;
- (NSDictionary *)med_pick:(NSArray *)keys;
- (NSDictionary *)med_omit:(NSArray *)key;


@end
