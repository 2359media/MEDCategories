//
//  UIView+MEDAutolayout.h
//  Pods
//
//  Created by Khoa Pham on 4/20/15.
//
//

#import <UIKit/UIKit.h>

@interface UIView (MEDAutolayout)

- (NSLayoutConstraint *)med_constraintForAttribute:(NSLayoutAttribute)attribute;

- (NSLayoutConstraint *)med_leftConstraint;
- (NSLayoutConstraint *)med_rightConstraint;
- (NSLayoutConstraint *)med_topConstraint;
- (NSLayoutConstraint *)med_bottomConstraint;
- (NSLayoutConstraint *)med_leadingConstraint;
- (NSLayoutConstraint *)med_trailingConstraint;
- (NSLayoutConstraint *)med_widthConstraint;
- (NSLayoutConstraint *)med_heightConstraint;
- (NSLayoutConstraint *)med_centerXConstraint;
- (NSLayoutConstraint *)med_centerYConstraint;
- (NSLayoutConstraint *)med_baseLineConstraint;

@end
