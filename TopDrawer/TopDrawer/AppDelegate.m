//
//  AppDelegate.m
//  TopDrawer
//
//  Created by Carl Udren on 2/8/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "AppDelegate.h"
#import "ColorPallete.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    ContentViewController *contentViewController = [[ContentViewController alloc] init];
    contentViewController.title = @"FEED";
    UINavigationController *contentNav = [[UINavigationController alloc] initWithRootViewController:contentViewController];
    
    SavedDrawerViewController *savedDrawerController = [[SavedDrawerViewController alloc] init];
    savedDrawerController.title = @"My Drawer";
    UINavigationController *savedNav = [[UINavigationController alloc] initWithRootViewController:savedDrawerController];
    
    [savedNav.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue" size:18]}];
    [contentNav.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue" size:18]}];
    
    
    savedNav.tabBarItem.image = [UIImage imageNamed:@"Save as-50.png"];
    contentNav.tabBarItem.image = [UIImage imageNamed:@"News-50.png"];
    savedNav.navigationBar.barTintColor = [ColorPallete defaultColorPallete].secondaryColor;
    contentNav.navigationBar.barTintColor = [ColorPallete defaultColorPallete].secondaryColor;
    
   tabBarController.tabBar.tintColor = [UIColor grayColor];
    
    [contentNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"M6962Xw.png"]forBarMetrics:UIBarMetricsDefault];
    [savedNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"M6962Xw.png"]forBarMetrics:UIBarMetricsDefault];

    [tabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"M6962Xw.png"]];
    tabBarController.tabBar.layer.masksToBounds = YES;
    
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    
    savedNav.navigationBar.tintColor = [UIColor grayColor];
    contentNav.navigationBar.tintColor = [UIColor grayColor];
    
    
    NSArray *array = @[contentNav, savedNav];
    tabBarController.viewControllers = array;
    
    
    
    [self.window makeKeyAndVisible];
    self.window.rootViewController = tabBarController;

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
