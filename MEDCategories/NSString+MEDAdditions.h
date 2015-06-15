//
//  NSString+MEDAdditions.h
//  MEDCategoriesDemo
//
//  Created by Khoa Pham on 3/19/15.
//  Copyright (c) 2015 2359Media. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MEDAdditions)

- (NSURL *)med_toURL;
- (BOOL)med_containsString:(NSString *)string;
- (BOOL)med_isEmail;
- (NSString *)med_fixedLineBreakString;
- (NSString *)med_percentEscapedQueryString;
- (NSDictionary *)med_toParams;
- (NSAttributedString *)med_htmlAttributedString;

@end
