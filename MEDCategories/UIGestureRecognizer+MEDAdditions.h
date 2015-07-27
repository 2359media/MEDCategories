//
//  UIGestureRecognizer+MEDAdditions.h
//  Pods
//
//  Created by Vinh Nguyen on 27/07/2015.
//
//

@import UIKit;

typedef void(^gestureBlock)(UIGestureRecognizer *gesture);

@interface UIGestureRecognizer (MEDAdditions)

/* Convenience helper to trigger gesture recognizer with a block
   rather than delegate 
 */
- (instancetype)initWithGestureBlock:(gestureBlock)block;

@end
