//
//  Constants.h
//  BuiltTwitterLogin
//
//  Created by Sameer on 14/05/14.
//  Copyright (c) 2014 raweng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constants : NSObject
#define iOS_VERSION  ([[[[[UIDevice currentDevice] systemVersion]componentsSeparatedByString:@"."] objectAtIndex:0] intValue])
@end
