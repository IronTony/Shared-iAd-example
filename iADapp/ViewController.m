//
//  ViewController.m
//  iADapp
//
//  Created by matthew ellis on 05/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

bool bannerLoadded;

- (void)viewDidLoad
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadBanner:) name:@"bannerLoaded" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(bannerError:) name:@"bannerError" object:nil];
    
    [SharedAdBannerView removeFromSuperview];
    [self.view addSubview:SharedAdBannerView];
  
    if (SharedAdBannerView.bannerLoaded==true) {
        SharedAdBannerView.hidden=false;
        bannerLoadded=true;
    }
    else {
        bannerLoadded=false;
    }
    [super viewDidLoad];
}
-(IBAction)open:(id)sender{
[[NSNotificationCenter defaultCenter] postNotificationName:@"bannerLoaded" object:self];
}
-(IBAction)close:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"bannerError" object:self];
}

-(void)loadBanner:(NSNotification *)notifcation{
    if (bannerLoadded==false) {
        SharedAdBannerView.hidden = false;
        bannerLoadded = true;
        
        [UIView beginAnimations:@"fixupViews" context:nil];
            CGRect adBannerViewFrame = [SharedAdBannerView frame];
            adBannerViewFrame.origin.x = 0;
            adBannerViewFrame.origin.y = 0;
            [SharedAdBannerView setFrame:adBannerViewFrame];
        [UIView commitAnimations];
    }
   }

-(void)bannerError:(NSNotification *)notifcation{   
    
    [UIView beginAnimations:@"fixupViews" context:nil];
        CGRect adBannerViewFrame = [SharedAdBannerView frame];
        adBannerViewFrame.origin.x = 0;
        adBannerViewFrame.origin.y = -50;
        [SharedAdBannerView setFrame:adBannerViewFrame];
    [UIView commitAnimations];
    
    SharedAdBannerView.hidden = false;
    bannerLoadded = false;
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
