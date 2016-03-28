//
//  AppDelegate.m
//  JSHome
//
//  Created by 吴胜杰 on 16/3/4.
//  Copyright © 2016年 DPSoftwareDevelopmentCompany. All rights reserved.
//

#import "AppDelegate.h"


#import "WelcomeViewController.h"
#import "DynamicViewController.h"
#import "HotViewController.h"
#import "TrainViewController.h"
#import "MeViewController.h"
 

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Bmob registerWithAppKey:@"daf8fb0fff7107230cdca9964c2877b3"];
    
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
//    self.window.rootViewController =[[WelcomeViewController alloc]init];
    [self creatMain];
    [self controlerBackgroundColor];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)creatMain{
    // 控制器的名字数组
    NSArray *controllerNameList = @[@"DynamicViewController",@"HotViewController",@"TrainViewController",@"MeViewController"];
    //装有控制器的数组
    NSMutableArray *controllerList = [NSMutableArray array];
    
    for (NSString *name in controllerNameList) {
        
        
        [controllerList addObject:[[UINavigationController alloc]initWithRootViewController:[[NSClassFromString(name) alloc]init]]];
        
        
    }
    
    NSArray *nameList = @[@"训练",@"热点",@"动态",@"我"];
    
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    
    tabBarController.viewControllers = controllerList;
    
    for (int i = 0; i<nameList.count; i++) {
        
        UITabBarItem *item = tabBarController.tabBar.items[i];
        
        item.title = nameList[i];
        
    }
    
    tabBarController.selectedIndex = 0;
    
    
    self.window.rootViewController = tabBarController;
    
    
    
    
    
}
//所有导航栏的颜色及标题大小
- (void)controlerBackgroundColor{
   
    [[UINavigationBar appearance ]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    [UINavigationBar appearance].barTintColor = [UIColor orangeColor];
   
    [UITabBar appearance].barTintColor = [UIColor orangeColor];
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName :[UIFont boldSystemFontOfSize:25]} forState:UIControlStateNormal];
    
    
    [UITabBar appearance].tintColor = [UIColor blackColor];
    
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
