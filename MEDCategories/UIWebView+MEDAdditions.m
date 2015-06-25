//
//  UIWebView+MEDAdditions.m
//  Pods
//
//  Created by Vinh Nguyen on 25/06/2015.
//
//

#import "UIWebView+MEDAdditions.h"

@implementation UIWebView (MEDAdditions)

- (NSString *)med_documentTitle
{
    return [self stringByEvaluatingJavaScriptFromString:@"document.title"];
}

- (NSString *)med_selectedText
{
    NSString *selectedText = [self stringByEvaluatingJavaScriptFromString:@"window.getSelection().toString()"];
    return selectedText;
}

@end
