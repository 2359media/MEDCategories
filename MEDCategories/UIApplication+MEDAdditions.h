//
//  UIApplication+MEDAdditions.h
//  Pods
//
//  Created by Vinh Nguyen on 17/08/2015.
//
//

#import <UIKit/UIKit.h>

@interface UIApplication (MEDAdditions)

- (NSString *)med_name;
- (NSString *)med_version;
- (NSString *)med_build;
- (NSString *)med_bundleIdentifier;

@end
