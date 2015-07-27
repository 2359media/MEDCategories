//
//  UIGestureRecognizer+MEDAdditions.m
//  Pods
//
//  Created by Vinh Nguyen on 27/07/2015.
//
//

#import <objc/runtime.h>
#import "UIGestureRecognizer+MEDAdditions.h"

static void *kGestureBlock;

@implementation UIGestureRecognizer (MEDAdditions)

- (instancetype)initWithGestureBlock:(gestureBlock)block
{
    self = [self initWithTarget:self action:@selector(triggerAction:)];
    if (self) {
        objc_setAssociatedObject(self, kGestureBlock, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return self;
}

- (void)triggerAction:(UIGestureRecognizer *)gesture
{
    gestureBlock block = objc_getAssociatedObject(self, kGestureBlock);
    if (block) {
        block(self);
    }
}

@end
