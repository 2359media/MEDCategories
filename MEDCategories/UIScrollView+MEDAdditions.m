//
//  UIScrollView+MEDAdditions.m
//  Pods
//
//  Created by Vinh Nguyen on 11/08/2015.
//
//

#import "UIScrollView+MEDAdditions.h"

@implementation UIScrollView (MEDAdditions)

- (void)med_scrollToOriginAnimated:(BOOL)animated
{
    [self setContentOffset:CGPointZero animated:animated];
}

- (void)med_scrollToTopAnimated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(self.contentOffset.x,
                                       0 - self.contentInset.top)
                  animated:animated];
}

- (void)med_scrollToBottomAnimated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(self.contentOffset.x,
                                       self.contentSize.height - self.bounds.size.height + self.contentInset.bottom)
                  animated:animated];
}

- (void)med_scrollToLeftAnimated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(0 - self.contentInset.left,
                                       self.contentOffset.y)
                  animated:animated];
}

- (void)med_scrollToRightAnimated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(self.contentSize.height - self.bounds.size.width + self.contentInset.right,
                                       self.contentOffset.y)
                  animated:animated];
}

@end
