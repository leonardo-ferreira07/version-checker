//
//  AppVersionChecker.m
//  VersionChecker
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 21/11/16.
//  Copyright © 2016 Leonardo Vinicius Kaminski Ferreira. All rights reserved.
//

#import "AppVersionChecker.h"

@implementation AppVersionChecker

+ (void)checkAppVersion:(NSString *)appBundleId completion:(void (^)(BOOL isOldVersion)) isOldVersion {
    
    NSOperationQueue *queue = [NSOperationQueue new];
    
    [queue addOperationWithBlock:^{
        
        NSString *urlString = [NSString stringWithFormat:@"http://itunes.apple.com/lookup?bundleId=%@&country=BR&lang=PT", appBundleId];
        NSURL *url = [NSURL URLWithString:urlString];
        
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            
            if(!error) {
                
                NSError *dictError = nil;
                
                NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&dictError];
                
                if(!dictError) {
                    NSArray *results = [NSArray new];
                    if(dictionary[@"results"]) {
                        results = [dictionary objectForKey:@"results"];
                        
                        if(results.count > 0) {
                            
                            NSDictionary *resultDict = [results firstObject];
                            NSString *currentAppStoreVersion = [NSString new];
                            
                            if(resultDict[@"version"]) {
                                currentAppStoreVersion = [resultDict objectForKey:@"version"];
                                
                                if(![[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]  isEqualToString:currentAppStoreVersion]) {
                                    isOldVersion(YES);
                                } else {
                                    isOldVersion(NO);
                                }
                                
                            } else {
                                isOldVersion(NO);
                            }
                            
                        } else {
                            isOldVersion(NO);
                        }
                        
                    } else {
                        isOldVersion(NO);
                    }
                } else {
                    isOldVersion(NO);
                    NSLog(@"Error to parse response: %@", dictError.description);
                }
            } else {
                isOldVersion(NO);
                NSLog(@"Error to execute web request: %@", error.description);
            }
            
        }] resume];
        
    }];
    
}


@end
