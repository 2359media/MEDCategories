//
//  NSDate+MEDAdditions.m
//  Pods
//
//  Created by Khoa Pham on 5/20/15.
//
//

#import "NSDate+MEDAdditions.h"

@implementation NSDate (MEDAdditions)

- (NSInteger)med_age {
    NSDateComponents* ageComponents = [[NSCalendar currentCalendar]
                                       components:NSYearCalendarUnit
                                       fromDate:self
                                       toDate:[NSDate date]
                                       options:0];
    return [ageComponents year];
}

#pragma mark - Compare
- (BOOL)med_isBefore:(NSDate *)date {
    return [self compare:date] == NSOrderedAscending;
}

- (BOOL)med_isAfter:(NSDate *)date {
    return [self compare:date] == NSOrderedDescending;
}

- (BOOL)med_isBetween:(NSDate *)startDate endDate:(NSDate *)endDate {
    return [self med_isAfter:startDate] && [self med_isBefore:endDate];
}

@end
