//
//  AppDelegate.m
//  SirFruit
//
//  Created by yong on 15/10/22.
//  Copyright © 2015年 iosYong. All rights reserved.
//

#import "AppDelegate.h"

#import "MainViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    self.window=[[UIWindow alloc] init];
    self.window.frame=[[UIScreen mainScreen] bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    MainViewController *vc = [[MainViewController alloc] init];
    self.window.rootViewController = vc;
    
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
   
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
   
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {

}

@end
