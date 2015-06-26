//
//  NSUserDefaults+MEDAdditions.h
//  Pods
//
//  Created by Vinh Nguyen on 26/06/2015.
//
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (MEDAdditions)

+ (void)med_saveObject:(id)object forKey:(NSString *)key;
+ (void)med_deleteObjectForKey:(NSString *)key;
+ (id)med_objectForKey:(NSString *)key;

@end
