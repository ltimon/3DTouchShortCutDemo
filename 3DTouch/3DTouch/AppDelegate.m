//
//  AppDelegate.m
//  3DTouch
//
//  Created by 李曈 on 15/10/11.
//  Copyright © 2015年 lt. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SecondViewController.h"
@interface AppDelegate (){
    UINavigationController *_rootNav;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _rootNav = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    self.window.rootViewController = _rootNav;
    [self.window makeKeyAndVisible];
    UIApplicationShortcutIcon *icom_1 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"01"];
    UIApplicationShortcutItem *quickItem_1 = [[UIApplicationShortcutItem alloc] initWithType:@"0" localizedTitle:@"没东西" localizedSubtitle:nil icon:icom_1 userInfo:nil];
    UIApplicationShortcutIcon *icom_2 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"02"];
    UIApplicationShortcutItem *quickItem_2 = [[UIApplicationShortcutItem alloc] initWithType:@"1" localizedTitle:@"写字板" localizedSubtitle:nil icon:icom_2 userInfo:nil];
    [[UIApplication sharedApplication] setShortcutItems:@[quickItem_1,quickItem_2]];
    return YES;
}
-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    self.window.rootViewController = _rootNav;
        if ([shortcutItem.type isEqualToString:@"0"]) {
            if (_rootNav.viewControllers.count > 1) {
                [_rootNav popToRootViewControllerAnimated:YES];
            }
        }else if ([shortcutItem.type isEqualToString:@"1"]){
            ViewController *rootView = (ViewController *)_rootNav.topViewController;
            [rootView.navigationController pushViewController:[[SecondViewController alloc] init] animated:YES];
        }

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
