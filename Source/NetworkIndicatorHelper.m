//
//  NetworkIndicatorHelper.m
//  AlamofireNetworkActivityIndicator
//
//  Created by Josh Luongo on 23/2/20.
//  Copyright © 2020 Alamofire. All rights reserved.
//

#import "NetworkIndicatorHelper.h"

#if TARGET_OS_IOS
    // Native UIKit
    @import UIKit;
#else
    // Reflection.
    @import ObjectiveC;
#endif

@implementation NetworkIndicatorHelper

#if TARGET_OS_IOS

#pragma mark - UIKit (iOS)

+ (void)changeNetworkIndicator:(BOOL)show {
    UIApplication.sharedApplication.networkActivityIndicatorVisible = show;
}

#else

#pragma mark - Reflection (watchOS)

+ (void)changeNetworkIndicator:(BOOL)show {
    @try {
        // Get UIApplcation on watchOS.
        Class UIApplication_class = objc_getClass("UIApplication");
        // Check for the `sharedApplication` singleton.
        if ([UIApplication_class valueForKey:@"sharedApplication"]) {
            // Set the `networkActivityIndicatorVisible` property.
            [[UIApplication_class valueForKey:@"sharedApplication"] setValue:@(show) forKey:@"networkActivityIndicatorVisible"];
        }
    } @catch (NSException *exception) {
        // Failed!
        NSLog(@"Failed to chnage the `networkActivityIndicatorVisible` property.");
    }
}

#endif

@end
