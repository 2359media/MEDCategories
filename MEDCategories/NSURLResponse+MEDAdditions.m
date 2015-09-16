//
//  NSURLResponse+MEDAdditions.m
//  Pods
//
//  Created by Vinh Nguyen on 16/09/2015.
//
//

#import "NSURLResponse+MEDAdditions.h"

@implementation NSURLResponse (MEDAdditions)

- (NSUInteger)med_statusCode
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)self;
    return (NSUInteger)httpResponse.statusCode;
}

@end
