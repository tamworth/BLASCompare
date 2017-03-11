//
//  AppDelegate.m
//  BLASCompare
//
//  Created by sheen on 2017/3/11.
//  Copyright © 2017年 sheen. All rights reserved.
//

#import "AppDelegate.h"

#define __USE_OPENBLAS__

#ifdef __USE_OPENBLAS__
#warning need add add libopenblas_armv8p-r0.2.20.dev & to remove Accelerate.framewrok
#include "cblas.h"
#else
#warning need to add Accelerate.framewrok & remove libopenblas_armv8p-r0.2.20.dev
#import <Accelerate/Accelerate.h>
#endif


@interface AppDelegate ()

@end

@implementation AppDelegate

-(void)testBlas
{
    double A[6] = {1.0,2.0,1.0,-3.0,4.0,-1.0};
    double B[6] = {1.0,2.0,1.0,-3.0,4.0,-1.0};
    double C[9] = {.5,.5,.5,.5,.5,.5,.5,.5,.5};
    cblas_dgemm(CblasColMajor, CblasNoTrans, CblasTrans,3,3,2,1,A, 3, B, 3,2,C,3);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    NSLog(@"start");
    for(int i = 0; i < 10000000; i++)
    {
        [self testBlas];
    }
    NSLog(@"end");
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
