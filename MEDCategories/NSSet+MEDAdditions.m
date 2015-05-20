//
//  NSSet+MEDAdditions.m
//  Pods
//
//  Created by Khoa Pham on 5/20/15.
//
//

#import "NSSet+MEDAdditions.h"

@implementation NSSet (MEDAdditions)

#pragma mark - RX
- (void)med_each:(void (^)(id))block {
    [self enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        block(obj);
    }];
}

- (void)med_eachWithIndex:(void (^)(id, int))block {
    __block int counter = 0;
    [self enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        block(obj, counter);
        counter ++;
    }];
}

- (NSArray *)med_map:(id (^)(id object))block {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];


    for (id object in self) {
        id mappedObject = block(object);
        if(mappedObject) {
            [array addObject:mappedObject];
        }
    }

    return array;
}

- (NSArray *)med_select:(BOOL (^)(id object))block {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];

    for (id object in self) {
        if (block(object)) {
            [array addObject:object];
        }
    }

    return array;
}

- (NSArray *)med_reject:(BOOL (^)(id object))block {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];

    for (id object in self) {
        if (block(object) == NO) {
            [array addObject:object];
        }
    }

    return array;
}

- (NSArray *)med_sort {
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    return [self sortedArrayUsingDescriptors:@[sortDescriptor]];
}

- (id)med_reduce:(id(^)(id accumulator, id object))block {
    return [self med_reduce:nil withBlock:block];
}

- (id)med_reduce:(id)initial withBlock:(id(^)(id accumulator, id object))block {
    id accumulator = initial;

    for(id object in self)
        accumulator = accumulator ? block(accumulator, object) : object;
    
    return accumulator;
}

@end
