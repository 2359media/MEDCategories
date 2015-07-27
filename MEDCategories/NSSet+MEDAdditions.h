//
//  NSSet+MEDAdditions.h
//  Pods
//
//  Created by Khoa Pham on 5/20/15.
//
//

@import Foundation;

@interface NSSet (MEDAdditions)

#pragma mark - RX
- (void)med_each:(void (^)(id))block;
- (void)med_eachWithIndex:(void (^)(id, int))block;
- (NSArray *)med_map:(id (^)(id object))block;
- (NSArray *)med_select:(BOOL (^)(id object))block;
- (NSArray *)med_reject:(BOOL (^)(id object))block;
- (NSArray *)med_sort;
- (id)med_reduce:(id(^)(id accumulator, id object))block;
- (id)med_reduce:(id)initial withBlock:(id(^)(id accumulator, id object))block;

@end
