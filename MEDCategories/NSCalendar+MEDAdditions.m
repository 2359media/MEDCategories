//
//  NSCalendar+MEDAdditions.m
//  Pods
//
//  Created by Vinh Nguyen on 15/06/2015.
//
//

#import "NSCalendar+MEDAdditions.h"

@implementation NSCalendar (MEDAdditions)

+ (NSCalendarUnit)med_calendarUnitForTimeInterval:(NSTimeInterval)interval
{
    NSDictionary *repeatInterval = @{
                                     @(60) : @(NSCalendarUnitMinute),
                                     @(3600) : @(NSCalendarUnitHour),
                                     @(86400) : @(NSCalendarUnitDay), // daily
                                     @(604800) : @(NSCalendarUnitWeekOfYear) // weekly
                                     };
    
    return [repeatInterval[@(interval)] integerValue];
}

+ (NSCalendar *)med_userCalendar
{
    return [[NSLocale currentLocale] objectForKey:NSLocaleCalendar];
}

@end
