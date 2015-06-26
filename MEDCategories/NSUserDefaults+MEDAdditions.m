//
//  NSUserDefaults+MEDAdditions.m
//  Pods
//
//  Created by Vinh Nguyen on 26/06/2015.
//
//

#import "NSUserDefaults+MEDAdditions.h"

@implementation NSUserDefaults (MEDAdditions)

+ (void)med_saveObject:(id)object forKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [self standardUserDefaults];
    [userDefaults setObject:object forKey:key];
    [userDefaults synchronize];
}

+ (void)med_deleteObjectForKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [self standardUserDefaults];
    [userDefaults removeObjectForKey:key];
    [userDefaults synchronize];
}

+ (id)med_objectForKey:(NSString *)key
{
    if (!key) {
        return nil;
    }

    return [[self standardUserDefaults] objectForKey:key];
}

@end
