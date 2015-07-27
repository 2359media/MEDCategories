//
//  NSDate+MEDAdditions.h
//  Pods
//
//  Created by Khoa Pham on 5/20/15.
//
//

@import Foundation;

@interface NSDate (MEDAdditions)

- (NSInteger)med_age;
- (NSInteger)med_minute;
- (NSInteger)med_hour;
- (NSInteger)med_day;
- (NSInteger)med_month;
- (NSInteger)med_year;

- (NSDate *)med_yesterday;
- (NSDate *)med_tomorrow;
- (NSDate *)med_dateByAddingDays:(NSInteger)days;

#pragma mark - Compare
- (BOOL)med_isBefore:(NSDate *)date;
- (BOOL)med_isEqualOrBefore:(NSDate *)date;
- (BOOL)med_isAfter:(NSDate *)date;
- (BOOL)med_isEqualOrAfter:(NSDate *)date;
- (BOOL)med_isBetween:(NSDate *)startDate endDate:(NSDate *)endDate;

@end
