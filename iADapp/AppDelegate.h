//
//  AppDelegate.h
//  iADapp
//
//  Created by matthew ellis on 05/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#define SharedAdBannerView ((AppDelegate *)[[UIApplication sharedApplication] delegate]).adBanner
#define SharedAdBannerViewIsLoaded ((AppDelegate *)[[UIApplication sharedApplication] delegate]).bannerLoaded

@interface AppDelegate : UIResponder <UIApplicationDelegate, ADBannerViewDelegate>{
UIWindow *window;
UITabBarController *tabBarController;
ADBannerView *adBanner;
    bool *bannerLoaded;
}
@property   (nonatomic,retain) ADBannerView *adBanner;

@property (strong, nonatomic) UIWindow *window;

@end
