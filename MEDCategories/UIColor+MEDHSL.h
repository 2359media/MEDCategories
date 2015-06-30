//
//  UIColor+MEDHSL.h
//  Pods
//
//  Created by Khoa Pham on 6/30/15.
//
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface MEDHSLColor : NSObject
@property (nonatomic, assign) CGFloat H;
@property (nonatomic, assign) CGFloat S;
@property (nonatomic, assign) CGFloat L;
@property (nonatomic, assign) CGFloat alpha;
@end

@interface UIColor (MEDHSL)

+ (UIColor *)med_colorWithHSLColor:(MEDHSLColor *)HSLColor;
- (MEDHSLColor *)med_toHSLColor;

@end
