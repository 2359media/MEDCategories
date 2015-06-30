//
//  NSValueTransformer+MEDAdditions.m
//  Pods
//
//  Created by Khoa Pham on 6/30/15.
//
//

#import "NSValueTransformer+MEDAdditions.h"
#import <Mantle.h>
#import "UIColor+MEDAdditions.h"

@implementation NSValueTransformer (MEDAdditions)

+ (NSValueTransformer *)med_stringTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(id value) {
        if ([value isKindOfClass:[NSNumber class]]) {
            return [value stringValue];
        }

        if ([value isKindOfClass:[NSString class]]) {
            return value;
        }

        return nil;

    } reverseBlock:^id(id value) {
        return value;
    }];
}

+ (NSValueTransformer *)med_colorTransformer {
    return [MTLValueTransformer transformerWithBlock:^id(NSString *hexString) {
        hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
        return hexString.length == 0 ? nil : [UIColor med_colorWithHexString:hexString];
    }];
}

+ (NSValueTransformer *)med_dateTransformer {
    return [MTLValueTransformer transformerWithBlock:^id(NSNumber *number) {
        return number.doubleValue == 0 ? nil : [NSDate dateWithTimeIntervalSince1970:number.doubleValue];
    }];
}

+ (NSValueTransformer *)med_URLTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *string) {
        if (![string isKindOfClass:[NSString class]]) {
            return nil;
        }
        return string.length > 0 ? [NSURL URLWithString:string] : nil;
    } reverseBlock:^id(NSURL *URL) {
        return [URL isKindOfClass:[NSURL class]] ? URL.absoluteString : nil;
    }];
}

@end
