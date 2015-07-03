//
//  UIColor+MEDAdditions.m
//  MEDCategoriesDemo
//
//  Created by Khoa Pham on 3/19/15.
//  Copyright (c) 2015 2359Media. All rights reserved.
//

#import "UIColor+MEDAdditions.h"
#import "UIColor+MEDHSL.h"

#define ARC4RANDOM_MAX      0x100000000

@implementation UIColor (MEDAdditions)

+ (UIColor *)med_colorWithHexString:(NSString *)hexString {
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];

    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];

    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];

    if ([cString length] != 6) return  [UIColor grayColor];

    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];

    range.location = 2;
    NSString *gString = [cString substringWithRange:range];

    range.location = 4;
    NSString *bString = [cString substringWithRange:range];

    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];

    return [UIColor med_colorWithRed:r
                               green:g
                                blue:b];
}

+ (UIColor *)med_colorWithHex:(CGFloat)hex {
    return [UIColor med_colorWithRed:(((NSInteger)hex & 0xFF0000) >> 16)
                               green:(((NSInteger)hex & 0x00FF00) >>  8)
                                blue:(((NSInteger)hex & 0x0000FF) >>  0)];
}

+ (UIColor *)med_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return [UIColor colorWithRed:red/255.0
                           green:green/255.0
                            blue:blue/255.0
                           alpha:1.0];
}

+ (UIColor *)med_randomColor
{
    CGFloat randomHue = ((double)arc4random() / ARC4RANDOM_MAX);
    return [UIColor colorWithHue:randomHue saturation:0.5 brightness:0.5 alpha:1];
}

+ (UIColor *)med_halfBlackColor {
    return [[UIColor blackColor] colorWithAlphaComponent:0.5];
}

+ (UIColor *)med_halfWhiteColor {
    return [[UIColor whiteColor] colorWithAlphaComponent:0.5];
}

- (UIColor *)med_darkenColor {
    return [self med_darkenColor:0.2];
}

- (UIColor *)med_lightenColor {
    return [self med_lightenColor:0.2];
}

- (UIColor *)med_darkenColor:(CGFloat)amount {
    amount = MIN(1, MAX(0, amount));
    MEDHSLColor *HSLColor = [self med_toHSLColor];
    HSLColor.L = MIN(1 - amount, HSLColor.L - amount);

    return [UIColor med_colorWithHSLColor:HSLColor];
}

- (UIColor *)med_lightenColor:(CGFloat)amount {
    amount = MIN(1, MAX(0, amount));
    MEDHSLColor *HSLColor = [self med_toHSLColor];
    HSLColor.L = MAX(amount, HSLColor.L + amount);

    return [UIColor med_colorWithHSLColor:HSLColor];
}

@end
