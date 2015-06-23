//
//  NSString+MEDCrypto.m
//  Pods
//
//  Created by Vinh Nguyen on 23/06/2015.
//
//

#import "NSString+MEDCrypto.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MEDCrypto)

- (NSString *)med_md5
{
    NSData *stringBytes = [self dataUsingEncoding:NSUTF8StringEncoding];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    if (CC_MD5([stringBytes bytes], [stringBytes length], result)) {
        NSMutableString *returnString = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
        for (int i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
            [returnString appendFormat:@"%02x", result[i]];
        }
        
        return [NSString stringWithString:returnString];
    }
    else {
        return nil;
    }
}

- (NSString *)med_sha1
{
    NSData *stringBytes = [self dataUsingEncoding:NSUTF8StringEncoding];
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    if (CC_SHA1([stringBytes bytes], [stringBytes length], result)) {
        NSMutableString *returnString = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH];
        for (int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
            [returnString appendFormat:@"%02x", result[i]];
        }
        
        return [NSString stringWithString:returnString];
    }
    else {
        return nil;
    }
}

@end
