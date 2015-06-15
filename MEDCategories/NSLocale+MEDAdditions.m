//
//  NSLocale+MEDAdditions.m
//  Pods
//
//  Created by Vinh Nguyen on 15/06/2015.
//
//

#import "NSLocale+MEDAdditions.h"

@implementation NSLocale (MEDAdditions)

+ (NSString *)med_deviceLanguageCode
{
    NSArray *languages = [NSLocale preferredLanguages];
    if (languages.count) {
        return [languages firstObject];
    }

    return [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode];
}

@end
