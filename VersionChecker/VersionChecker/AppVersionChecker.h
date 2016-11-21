//
//  AppVersionChecker.h
//  VersionChecker
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 21/11/16.
//  Copyright © 2016 Leonardo Vinicius Kaminski Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppVersionChecker : NSObject

/** @brief This method checks the app version and returns a BOOL value if current version is deprecated.
 @param This method receives the app bundle ID string. */
+ (void)checkAppVersion:(NSString *)appBundleId completion:(void (^)(BOOL isOldVersion)) isOldVersion;

@end
