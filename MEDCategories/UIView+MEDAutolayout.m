//
//  UIView+MEDAutolayout.m
//  Pods
//
//  Created by Khoa Pham on 4/20/15.
//
//

#import "UIView+MEDAutolayout.h"

@implementation UIView (MEDAutolayout)

- (NSLayoutConstraint *)med_constraintForAttribute:(NSLayoutAttribute)attribute {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstAttribute = %d && (firstItem = %@ || secondItem = %@)", attribute, self, self];
    NSArray *constraintArray = [self.superview constraints];

    if (attribute == NSLayoutAttributeWidth || attribute == NSLayoutAttributeHeight) {
        constraintArray = [self constraints];
    }

    NSArray *fillteredArray = [constraintArray filteredArrayUsingPredicate:predicate];
    if(fillteredArray.count == 0) {
        return nil;
    } else {
        return fillteredArray.firstObject;
    }
}

- (NSLayoutConstraint *)med_leftConstraint {
    return [self med_constraintForAttribute:NSLayoutAttributeLeft];
}

- (NSLayoutConstraint *)med_rightConstraint {
    return [self med_constraintForAttribute:NSLayoutAttributeRight];
}

- (NSLayoutConstraint *)med_topConstraint {
    return [self med_constraintForAttribute:NSLayoutAttributeTop];
}

- (NSLayoutConstraint *)med_bottomConstraint {
    return [self med_constraintForAttribute:NSLayoutAttributeBottom];
}

- (NSLayoutConstraint *)med_leadingConstraint {
    return [self med_constraintForAttribute:NSLayoutAttributeLeading];
}

- (NSLayoutConstraint *)med_trailingConstraint {
    return [self med_constraintForAttribute:NSLayoutAttributeTrailing];
}

- (NSLayoutConstraint *)med_widthConstraint {
    return [self med_constraintForAttribute:NSLayoutAttributeWidth];
}

- (NSLayoutConstraint *)med_heightConstraint {
    return [self med_constraintForAttribute:NSLayoutAttributeHeight];
}

- (NSLayoutConstraint *)med_centerXConstraint {
    return [self med_constraintForAttribute:NSLayoutAttributeCenterX];
}

- (NSLayoutConstraint *)med_centerYConstraint {
    return [self med_constraintForAttribute:NSLayoutAttributeCenterY];
}

- (NSLayoutConstraint *)med_baseLineConstraint {
    return [self med_constraintForAttribute:NSLayoutAttributeBaseline];
}

@end
