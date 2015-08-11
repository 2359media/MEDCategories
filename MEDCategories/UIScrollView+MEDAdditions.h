//
//  UIScrollView+MEDAdditions.h
//  Pods
//
//  Created by Vinh Nguyen on 11/08/2015.
//
//

#import <UIKit/UIKit.h>

@interface UIScrollView (MEDAdditions)

- (void)med_scrollToOriginAnimated:(BOOL)animated;
- (void)med_scrollToTopAnimated:(BOOL)animated;
- (void)med_scrollToBottomAnimated:(BOOL)animated;
- (void)med_scrollToLeftAnimated:(BOOL)animated;
- (void)med_scrollToRightAnimated:(BOOL)animated;

@end
