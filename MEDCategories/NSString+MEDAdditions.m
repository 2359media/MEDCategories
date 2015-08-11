//
//  NSString+MEDAdditions.m
//  MEDCategoriesDemo
//
//  Created by Khoa Pham on 3/19/15.
//  Copyright (c) 2015 2359Media. All rights reserved.
//

#import "NSString+MEDAdditions.h"

@implementation NSString (MEDAdditions)

- (NSURL *)med_toURL {
    return [NSURL URLWithString:self];
}

- (NSString *)med_fixedLineBreakString {
    return [self stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
}

- (NSString *)med_percentEscapedQueryString {
    NSStringEncoding stringEncoding = NSUTF8StringEncoding;

    static NSString * const kAFCharactersToBeEscaped = @":/?&=;+!@#$()',*";
    static NSString * const kAFCharactersToLeaveUnescaped = @"[].";

    return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)self, (__bridge CFStringRef)kAFCharactersToLeaveUnescaped, (__bridge CFStringRef)kAFCharactersToBeEscaped, CFStringConvertNSStringEncodingToEncoding(stringEncoding));
}

- (NSDictionary *)med_toParams {
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    if (self) {
        NSScanner *parameterScanner = [[NSScanner alloc] initWithString:self];
        NSString *name = nil;
        NSString *value = nil;

        while (![parameterScanner isAtEnd]) {
            name = nil;
            [parameterScanner scanUpToString:@"=" intoString:&name];
            [parameterScanner scanString:@"=" intoString:NULL];

            value = nil;
            [parameterScanner scanUpToString:@"&" intoString:&value];
            [parameterScanner scanString:@"&" intoString:NULL];

            if (name && value) {
                parameters[[name stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] = [value stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            }
        }
    }
    
    return parameters;
}

- (NSAttributedString *)med_htmlAttributedString {
    if (!self || [self length] == 0) {
        return nil;
    }
    
    NSDictionary *option = @{ NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType };
    NSError *attributedError;
    NSData *stringData = [self dataUsingEncoding:NSUTF16StringEncoding];
    NSAttributedString *htmlAttributedString = [[NSAttributedString alloc] initWithData:stringData
                                                                                options:option
                                                                     documentAttributes:nil
                                                                                  error:&attributedError];
    return htmlAttributedString;
}

- (NSUInteger)med_wordCount {
    NSScanner *scanner = [NSScanner scannerWithString:self];
    NSCharacterSet *whiteSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    
    NSUInteger count = 0;
    while ([scanner scanUpToCharactersFromSet:whiteSpace intoString:nil]) {
        count++;
    }
    
    return count;
}

- (NSString *)med_percentEscapedString {
    return [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)med_capitalizedFirstLetterString {
    if (self.length <= 1) {
        return self.uppercaseString;
    }

    NSString *firstChar = [self substringToIndex:1].uppercaseString;
    return [firstChar stringByAppendingString:[self substringFromIndex:1]];
}

- (NSString *)med_stringByLeadingAndTrailingWhitespace {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)med_stringByCleaningWhitespace {
    NSString *newlineRemoved = [self stringByReplacingOccurrencesOfString:@"\n" withString:@"" options:0 range:NSMakeRange(0, self.length)];
    NSString *squashed = [newlineRemoved stringByReplacingOccurrencesOfString:@"[ ]+" withString:@" " options:NSRegularExpressionSearch range:NSMakeRange(0, newlineRemoved.length)];
    return [squashed stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)med_stringByRemovingCharactersInSet:(NSCharacterSet *)characterSet {
    NSScanner *scanner = [NSScanner scannerWithString:self];
    scanner.charactersToBeSkipped = characterSet;
    
    NSMutableString *aggredate = [NSMutableString new];
    while (!scanner.isAtEnd) {
        NSString *result;
        if ([scanner scanUpToCharactersFromSet:characterSet intoString:&result]) {
            [aggredate appendString:result];
        }

    }
    
    return aggredate;
}

- (NSString *)med_stringByRemovingCharactersNotInSet:(NSCharacterSet *)characterSet {
    return [self med_stringByRemovingCharactersInSet:[characterSet invertedSet]];
}

- (NSString *)med_stringByAbbreviating {
    if (self.length >= 1) {
        return [[[self substringFromIndex:1] capitalizedStringWithLocale:[NSLocale currentLocale]]
                stringByAppendingString:@"."];
    }
    
    return self;
}

- (NSString *)med_abbreviatedName {
    NSString *processedName = [self med_stringByCleaningWhitespace];
    NSArray *nameComponents = [processedName componentsSeparatedByString:@"."];
    
    NSUInteger *componentCount = [nameComponents count];
    NSMutableArray *processedNameComponents = [[NSMutableArray alloc] initWithCapacity:componentCount];
    for (NSUInteger i = 0; i < componentCount; i++) {
        if (i == 0) {
            processedNameComponents[i] = nameComponents[i];
        }
        else {
            processedNameComponents[i] = [nameComponents[i] med_stringByAbbreviating];
        }
    }

    return [processedNameComponents componentsJoinedByString:@" "];
}

- (NSString *)med_stringByRemovingTrailingSlash {
    if (self.length >= 1) {
        if ([[self substringFromIndex:self.length - 1] isEqualToString:@"/"]) {
            return [self substringToIndex:self.length - 1];
        }
        else {
            return self;
        }
    }
    
    return self;
}

#pragma mark - Validation

- (BOOL)med_containsString:(NSString *)string {
    NSRange range = [self rangeOfString:string options:NSCaseInsensitiveSearch];
    return range.location != NSNotFound;
}

- (BOOL)med_isEmail {
    BOOL stricterFilter = NO;
    
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:self];
}

- (BOOL)med_isInteger {
    NSCharacterSet *alphaNums = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *stringSet = [NSCharacterSet characterSetWithCharactersInString:self];
    
    return [alphaNums isSupersetOfSet:stringSet];
}

@end
