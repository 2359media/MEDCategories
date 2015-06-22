//
//  NSNumber+MEDAdditions.h
//  Pods
//
//  Created by Khoa Pham on 5/20/15.
//
//

#import <Foundation/Foundation.h>

@interface NSNumber (MEDAdditions)

- (void)med_times:(void (^)(void))block;
- (void)med_timesWithIndex:(void (^)(NSUInteger))block;
- (void)med_upto:(int)number do:(void (^)(NSInteger))block;
- (void)med_downto:(int)number do:(void (^)(NSInteger))block;

- (NSString *)med_toStringWithStyle:(NSNumberFormatterStyle)style;
- (NSString *)med_toString;
- (NSString *)med_toStringWithDecimalStyle;
- (NSString *)med_toStringWithCurrencyStyle;
- (NSString *)med_toStringWithPercentStyle;
- (NSString *)med_toStringWithScientificStyle;
- (NSString *)med_toStringWithSpellOutStyle;

@end
