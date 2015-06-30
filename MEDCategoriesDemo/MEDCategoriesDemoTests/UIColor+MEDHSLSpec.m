//
//  UIColor+MEDHSLSpec.m
//  MEDCategoriesDemo
//
//  Created by Khoa Pham on 6/30/15.
//  Copyright (c) 2015 2359Media. All rights reserved.
//

#import <Kiwi.h>
#import <UIColor+MEDHSL.h>

SPEC_BEGIN(HSLSpec)

describe(@"HSL", ^{
    it(@"should initialize correct HSLColor", ^{
        UIColor *redColor = [UIColor yellowColor];
        MEDHSLColor *HSLColor = [redColor med_toHSLColor];

//        [[@(HSLColor.H) should] equal:@(0.0)];
        [[@(HSLColor.S) should] equal:@(1.0)];
        [[@(HSLColor.L) should] equal:@(0.5)];
        [[@(HSLColor.alpha) should] equal:@(1.0)];
    });

    it(@"should return correct UIColor from HSLColor", ^{
        MEDHSLColor *HSLColor = [[MEDHSLColor alloc] init];
        (void)(HSLColor);
    });
});

SPEC_END
