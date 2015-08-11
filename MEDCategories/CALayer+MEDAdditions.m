//
//  CALayer+MEDAdditions.m
//  Pods
//
//  Created by Vinh Nguyen on 11/08/2015.
//
//

#import "CALayer+MEDAdditions.h"

@implementation CALayer (MEDAdditions)

- (void)med_enumerateSublayersWithBlock:(void (^)())block
{
    block(self);
    
    for (CALayer *layer in self.sublayers) {
        [layer med_enumerateSublayersWithBlock:block];
    }
}

@end
