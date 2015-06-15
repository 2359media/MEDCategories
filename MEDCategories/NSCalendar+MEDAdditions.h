//
//  NSCalendar+MEDAdditions.h
//  Pods
//
//  Created by Vinh Nguyen on 15/06/2015.
//
//

#import <Foundation/Foundation.h>

@interface NSCalendar (MEDAdditions)

+ (NSCalendarUnit)med_calendarUnitForTimeInterval:(NSTimeInterval)interval;
+ (NSCalendar *)med_userCalendar;

@end
