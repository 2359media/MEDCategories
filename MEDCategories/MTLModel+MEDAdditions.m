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

@end
