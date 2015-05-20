//
//  NSDate+MEDAdditions.h
//  Pods
//
//  Created by Khoa Pham on 5/20/15.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (MEDAdditions)

- (NSInteger)med_age;

#pragma mark - Compare
- (BOOL)med_isBefore:(NSDate *)date;
- (BOOL)med_isAfter:(NSDate *)date;
- (BOOL)med_isBetween:(NSDate *)startDate endDate:(NSDate *)endDate;

@end
