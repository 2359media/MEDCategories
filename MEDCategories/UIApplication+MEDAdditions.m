//
//  UIApplication+MEDAdditions.m
//  Pods
//
//  Created by Vinh Nguyen on 17/08/2015.
//
//

#import "UIApplication+MEDAdditions.h"

@implementation UIApplication (MEDAdditions)

- (NSString *)med_name
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleDisplayName"];
}

- (NSString *)med_version
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}

- (NSString *)med_build
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleVersion"];
}

- (NSString *)med_bundleIdentifier
{
    return [NSBundle mainBundle].bundleIdentifier;
}

@end
