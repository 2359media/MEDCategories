//
//  MTLModel+MEDAdditions.m
//  Pods
//
//  Created by Khoa Pham on 4/20/15.
//
//

#import "MTLModel+MEDAdditions.h"

@implementation MTLModel (MEDAdditions)

+ (instancetype)med_modelFromJSONDictionary:(NSDictionary *)JSONDictionary {
    return [MTLJSONAdapter modelOfClass:self fromJSONDictionary:JSONDictionary error:nil];
}

+ (NSArray *)med_modelsFromJSONArray:(NSArray *)JSONArray {
    return [MTLJSONAdapter modelsOfClass:[self class] fromJSONArray:JSONArray error:nil];
}

- (void)med_mergeWithDictionary:(NSDictionary *)dictionary {
    MTLModel *model = [[self class] med_modelFromJSONDictionary:dictionary];
    return [self med_mergeValuesForKeysFromModelIgnoringNil:model];
}

- (void)med_mergeValuesForKeysFromModelIgnoringNil:(MTLModel *)model {
    NSSet *propertyKeys = model.class.propertyKeys;
    for (NSString *key in self.class.propertyKeys) {
        if (![propertyKeys containsObject:key]) {
            continue;
        }

        if (![model valueForKey:key] && [[model valueForKey:key] isKindOfClass:[NSNull class]]) {
            continue;
        }

        [self mergeValueForKey:key fromModel:model];
    }
}

@end
