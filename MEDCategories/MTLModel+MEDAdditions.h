//
//  MTLModel+MEDAdditions.h
//  Pods
//
//  Created by Khoa Pham on 4/20/15.
//
//

#import <Mantle.h>

@interface MTLModel (MEDAdditions)

+ (instancetype)med_modelFromJSONDictionary:(NSDictionary *)JSONDictionary;
+ (NSArray *)med_modelsFromJSONArray:(NSArray *)JSONArray;

- (void)med_mergeWithDictionary:(NSDictionary *)dictionary;
- (void)med_mergeValuesForKeysFromModelIgnoringNil:(MTLModel *)model;

@end
