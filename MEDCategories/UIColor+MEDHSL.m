//
//  UIColor+MEDHSL.m
//  Pods
//
//  Created by Khoa Pham on 6/30/15.
//
//

#import "UIColor+MEDHSL.h"

@implementation MEDHSLColor
@end

@implementation UIColor (MEDHSL)

+ (UIColor *)med_colorWithHSLColor:(MEDHSLColor *)HSLColor {
    return [UIColor med_colorWithH:HSLColor.H
                                 S:HSLColor.S
                                 L:HSLColor.L
                             alpha:HSLColor.alpha];
}

- (MEDHSLColor *)med_toHSLColor {
    CGFloat H, S, L, alpha;
    [self med_getH:&H S:&S L:&L alpha:&alpha];

    MEDHSLColor *HSLColor = [[MEDHSLColor alloc] init];
    HSLColor.H = H;
    HSLColor.S = S;
    HSLColor.L = L;
    HSLColor.alpha = alpha;

    return HSLColor;
}

#pragma mark - Helper
// https://github.com/thisandagain/color
+ (UIColor *)med_colorWithH:(CGFloat)H S:(CGFloat)S L:(CGFloat)L alpha:(CGFloat)alpha{
    CGFloat			temp1, temp2;
    CGFloat			temp[3];
    int				i;
    CGFloat R, G, B;

    // Check for saturation. If there isn't any just return the luminance value for each, which results in gray.
    if (S == 0.0) {
        return [UIColor colorWithRed:L green:L blue:L alpha:alpha];
    }

    // Test for luminance and compute temporary values based on luminance and saturation
    if (L < 0.5)
        temp2 = L * (1.0 + S);
    else
        temp2 = L + S - L * S;
    temp1 = 2.0 * L - temp2;

    // Compute intermediate values based on hue
    temp[0] = H + 1.0 / 3.0;
    temp[1] = H;
    temp[2] = H - 1.0 / 3.0;

    for (i = 0; i < 3; ++i) {

        // Adjust the range
        if (temp[i] < 0.0)
            temp[i] += 1.0;
        if (temp[i] > 1.0)
            temp[i] -= 1.0;


        if (6.0 * temp[i] < 1.0) {
            temp[i] = temp1 + (temp2 - temp1) * 6.0 * temp[i];
        } else {
            if (2.0 * temp[i] < 1.0) {
                temp[i] = temp2;
            } else {
                if (3.0 * temp[i] < 2.0) {
                    temp[i] = temp1 + (temp2 - temp1) * ((2.0 / 3.0) - temp[i]) * 6.0;
                } else {
                    temp[i] = temp1;
                }
            }
        }
    }

    R = temp[0];
    G = temp[1];
    B = temp[2];

    return [UIColor colorWithRed:R green:G blue:B alpha:alpha];
}

- (void)med_getH:(CGFloat *)outH S:(CGFloat *)outS L:(CGFloat *)outL alpha:(CGFloat *)outAlpha {
    CGFloat h,s,l,v,m,vm,r2,g2,b2; h = 0; s = 0;

    CGFloat r, g, b;
    [self getRed:&r green:&g blue:&b alpha:outAlpha];

    v = MAX(r, g);
    v = MAX(v, b);
    m = MIN(r, g);
    m = MIN(m, b);

    l = (m+v)/2.0f;

    if (l <= 0.0) {
        if(outH)
            *outH = h;
        if(outS)
            *outS = s;
        if(outL)
            *outL = l;
        return;
    }

    vm = v - m;
    s = vm;

    if (s > 0.0f) {
        s/= (l <= 0.5f) ? (v + m) : (2.0 - v - m);
    } else {
        if(outH)
            *outH = h;
        if(outS)
            *outS = s;
        if(outL)
            *outL = l;
        return;
    }

    r2 = (v - r)/vm;
    g2 = (v - g)/vm;
    b2 = (v - b)/vm;

    if (r == v){
        h = (g == m ? 5.0f + b2 : 1.0f - g2);
    }else if (g == v){
        h = (b == m ? 1.0f + r2 : 3.0 - b2);
    }else{
        h = (r == m ? 3.0f + g2 : 5.0f - r2);
    }

    h/=6.0f;

    if (outH)
        *outH = h;
    if (outS)
        *outS = s;
    if (outL)
        *outL = l;
}

@end