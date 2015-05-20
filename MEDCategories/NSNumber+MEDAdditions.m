//
//  NSNumber+MEDAdditions.m
//  Pods
//
//  Created by Khoa Pham on 5/20/15.
//
//

#import "NSNumber+MEDAdditions.h"

@implementation NSNumber (MEDAdditions)

#pragma mark - RX
- (void)med_times:(void (^)(void))block {
    for (int i = 0; i < self.integerValue; i++)
        block();
}

- (void)med_timesWithIndex:(void (^)(NSUInteger))block {
    for (NSUInteger i = 0; i < self.unsignedIntegerValue; i++)
        block(i);
}

- (void)med_upto:(int)number do:(void (^)(NSInteger))block {
    for (NSInteger i = self.integerValue; i <= number; i++)
        block(i);
}

- (void)med_downto:(int)number do:(void (^)(NSInteger))block {
    for (NSInteger i = self.integerValue; i >= number; i--)
        block(i);
}

@end
