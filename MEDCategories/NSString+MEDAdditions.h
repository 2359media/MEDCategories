//
//  NSString+MEDAdditions.h
//  MEDCategoriesDemo
//
//  Created by Khoa Pham on 3/19/15.
//  Copyright (c) 2015 2359Media. All rights reserved.
//

@import Foundation;

@interface NSString (MEDAdditions)

- (NSURL *)med_toURL;
- (NSString *)med_fixedLineBreakString;
- (NSString *)med_percentEscapedQueryString;
- (NSDictionary *)med_toParams;
- (NSAttributedString *)med_htmlAttributedString;
- (NSUInteger)med_wordCount;
- (NSString *)med_percentEscapedString;
- (NSString *)med_capitalizedFirstLetterString;
- (NSString *)med_stringByLeadingAndTrailingWhiteSpace;
// Trims leading and trailing whitespace and flattens multtiple whitespaces into a single space
- (NSString *)med_stringByCleaningWhitespace;
// Returns a string with all the characters in the set removed
- (NSString *)med_stringByRemovingCharactersInSet:(NSCharacterSet *)characterSet;
// Returns a string consisting only of the characters in the characterSet
- (NSString *)med_stringByRemovingCharactersNotInSet:(NSCharacterSet *)characterSet;
// Converts "John" -> "J."
- (NSString *)med_stringByAbbreviating;
// Converts "John Doe" -> "John D."
- (NSString *)med_abbreviatedName;
- (NSString *)med_stringByRemovingTrailingSlash;

// validation
- (BOOL)med_containsString:(NSString *)string;
- (BOOL)med_isEmail;
- (BOOL)med_isInteger;

@end
