# version-checker
This sample app verify the app version according to the App Store version.

### Continuous integration - branch master
[![CI Status Master](https://travis-ci.org/leonardo-ferreira07/version-checker.svg?branch=master)](https://travis-ci.org/leonardo-ferreira07/version-checker)

## Usage
If you want to use this in your project, just drag the ```AppVersionChecker.h``` and ```AppVersionChecker.m``` files into your project. Call the mehtod to verify you app version, sending via parameter your app bundle ID registered on App Store.

### Examples
Objective-C
```objc
#import "AppVersionChecker.h"

[AppVersionChecker checkAppVersion:@"yourAppBundleID" completion:^(BOOL isOldVersion) {
        if(isOldVersion)
            NSLog(@"that's all folks, this version is deprecated");
        else
            NSLog(@"that's all folks, this version is updated");
}];
```
Swift - Import the files referenced above, and just add ```#import "AppVersionChecker.h"``` to **yourApp-Bridging-Header.h**.
```swift
AppVersionChecker.checkAppVersion("yourAppBundleID") { isOldVersion in
    if(isOldVersion) {
        print("that's all folks, this version is deprecated")
    } else {
        print("that's all folks, this version is updated")
    }
}
```
