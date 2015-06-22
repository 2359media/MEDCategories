//
//  NSNumber+MEDAdditions.m
//  Pods
//
//  Created by Khoa Pham on 5/20/15.
//
//

#import "NSNumber+MEDAdditions.h"

@implementation NSNumber (MEDAdditions)

#pragma mark - RX
- (void)med_times:(void (^)(void))block {
    for (int i = 0; i < self.integerValue; i++)
        block();
}

- (void)med_timesWithIndex:(void (^)(NSUInteger))block {
    for (NSUInteger i = 0; i < self.unsignedIntegerValue; i++)
        block(i);
}

- (void)med_upto:(int)number do:(void (^)(NSInteger))block {
    for (NSInteger i = self.integerValue; i <= number; i++)
        block(i);
}

- (void)med_downto:(int)number do:(void (^)(NSInteger))block {
    for (NSInteger i = self.integerValue; i >= number; i--)
        block(i);
}

#pragma mark - Base

- (NSString *)med_toStringWithStyle:(NSNumberFormatterStyle)style
{
    return [NSNumberFormatter localizedStringFromNumber:self numberStyle:style];
}

- (NSString *)med_toString
{
    return [NSNumberFormatter localizedStringFromNumber:self numberStyle:NSNumberFormatterNoStyle];
}

#pragma mark - Style

- (NSString *)med_toStringWithDecimalStyle
{
    return [NSNumberFormatter localizedStringFromNumber:self numberStyle:NSNumberFormatterDecimalStyle];
}

- (NSString *)med_toStringWithCurrencyStyle
{
    return [NSNumberFormatter localizedStringFromNumber:self numberStyle:NSNumberFormatterCurrencyStyle];
}

- (NSString *)med_toStringWithPercentStyle
{
    return [NSNumberFormatter localizedStringFromNumber:self numberStyle:NSNumberFormatterPercentStyle];
}

- (NSString *)med_toStringWithScientificStyle
{
    return [NSNumberFormatter localizedStringFromNumber:self numberStyle:NSNumberFormatterScientificStyle];
}

- (NSString *)med_toStringWithSpellOutStyle
{
    return [NSNumberFormatter localizedStringFromNumber:self numberStyle:NSNumberFormatterSpellOutStyle];
}

@end
