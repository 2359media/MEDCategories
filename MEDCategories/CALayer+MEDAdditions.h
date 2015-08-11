//
//  CALayer+MEDAdditions.h
//  Pods
//
//  Created by Vinh Nguyen on 11/08/2015.
//
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (MEDAdditions)

- (void)med_enumerateSublayersWithBlock:(void (^)())block;

@end
