//
//  NSValueTransformer+MEDAdditions.h
//  Pods
//
//  Created by Khoa Pham on 6/30/15.
//
//

#import <Foundation/Foundation.h>

@interface NSValueTransformer (MEDAdditions)

+ (NSValueTransformer *)med_stringTransformer;
+ (NSValueTransformer *)med_colorTransformer;
+ (NSValueTransformer *)med_dateTransformer;
+ (NSValueTransformer *)med_URLTransformer;

@end
