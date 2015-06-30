//
//  NSDate+MEDAdditions.m
//  Pods
//
//  Created by Khoa Pham on 5/20/15.
//
//

#import "NSDate+MEDAdditions.h"

@implementation NSDate (MEDAdditions)

#pragma mark - Component
- (NSInteger)med_age {
    NSDateComponents *ageComponents = [[NSCalendar currentCalendar]
                                       components:NSYearCalendarUnit
                                       fromDate:self
                                       toDate:[NSDate date]
                                       options:0];
    return [ageComponents year];
}

- (NSInteger)med_minute {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSMinuteCalendarUnit fromDate:self];
    return [components minute];
}

- (NSInteger)med_hour {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSHourCalendarUnit fromDate:self];
    return [components hour];
}

- (NSInteger)med_day {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit fromDate:self];
    return [components day];
}

- (NSInteger)med_month {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSMonthCalendarUnit fromDate:self];
    return [components month];
}

- (NSInteger)med_year {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSYearCalendarUnit fromDate:self];
    return [components year];
}

#pragma mark - Days
- (NSDate *)med_yesterday {
    return [self med_dateByAddingDays:-1];
}

- (NSDate *)med_tomorrow {
    return [self med_dateByAddingDays:1];
}

- (NSDate *)med_dateByAddingDays:(NSInteger)days {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.day = days;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

#pragma mark - Compare
- (BOOL)med_isBefore:(NSDate *)date {
    return [self compare:date] == NSOrderedAscending;
}

- (BOOL)med_isEqualOrBefore:(NSDate *)date {
    return [self compare:date] != NSOrderedDescending;
}

- (BOOL)med_isAfter:(NSDate *)date {
    return [self compare:date] == NSOrderedDescending;
}

- (BOOL)med_isEqualOrAfter:(NSDate *)date {
    return [self compare:date] != NSOrderedAscending;
}

- (BOOL)med_isBetween:(NSDate *)startDate endDate:(NSDate *)endDate {
    return [self med_isEqualOrAfter:startDate] && [self med_isEqualOrBefore:endDate];
}

@end
