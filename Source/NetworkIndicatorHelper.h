//
//  NetworkIndicatorHelper.h
//  AlamofireNetworkActivityIndicator
//
//  Created by Josh Luongo on 23/2/20.
//  Copyright © 2020 Alamofire. All rights reserved.
//

@import Foundation;

@interface NetworkIndicatorHelper : NSObject

/**
 Change the `networkActivityIndicatorVisible` property.
 
 We use the wrapper function to handle showing the spinner on watchOS via a private API.
 @param show Show the network spinner.
 */
+ (void)changeNetworkIndicator:(BOOL)show;

@end
