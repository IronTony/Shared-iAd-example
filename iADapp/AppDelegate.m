//
//  AppDelegate.m
//  iADapp
//
//  Created by matthew ellis on 05/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize adBanner;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
   
    adBanner = [[ADBannerView alloc] initWithFrame:CGRectZero];
    adBanner.currentContentSizeIdentifier =ADBannerContentSizeIdentifierPortrait;
    adBanner.delegate = self;
   // adBanner.backgroundColor = [UIColor clearColor];
    adBanner.hidden = true;
    return YES;
}
- (void)bannerViewDidLoadAd:(ADBannerView *)banner{
   
[[NSNotificationCenter defaultCenter] postNotificationName:@"bannerLoaded" object:self];
   
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    if (adBanner.bannerLoaded == true) {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"bannerError" object:self];
    }
}

@end
