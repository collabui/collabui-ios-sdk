//
//  AppDelegate.m
//  SampleApp
//
//  Copyright © 2017 CollabUI. All rights reserved.
//

#import "AppDelegate.h"
#import <CollabUI/CollabUI.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if ([launchOptions valueForKey:UIApplicationLaunchOptionsURLKey] != nil)
    {
        return YES;
    }
    return NO;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    if ([[CollabUI sharedInstance] openURL:url])
    {
        return YES;
    }
    return NO;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[CollabUI sharedInstance] initializeWithApiKey:@"<your api key>"];
    return YES;
}

@end
