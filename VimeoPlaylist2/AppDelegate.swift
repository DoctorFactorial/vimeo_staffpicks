//
//  AppDelegate.swift
//  VimeoPlaylist2
//
//  Created by Michael Gordon on 09/08/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//

import Parse
import Bolts
import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Parse
        Parse.setApplicationId("6mccRSrRJdUHaMxWNH9RmR84AQ3II6RLmkXKZtfQ",
            clientKey: "nLAhNM0sanh2N9COYEHYk94j2VFY5ojqS5R5PvBM")
        
        PFAnalytics.trackAppOpenedWithLaunchOptionsInBackground(launchOptions, block: nil)
        
        // Override point for customization after application launch.
        self.setupAppAppearance()
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        var navigationController = UINavigationController()
        //var playlistsViewController = PlaylistsViewController(nibName: "PlaylistsViewController", bundle: nil)
        var tabBarController = TabBarController()
        navigationController.viewControllers = [tabBarController]
        tabBarController.selectedIndex = 1
        
        self.window!.rootViewController = navigationController
        self.window!.makeKeyAndVisible()
        
        //self.window?.rootViewController = PopularViewController(nibName: "PopularViewController", bundle: nil)
        //self.window?.makeKeyAndVisible()
        
        // Test Parse
        let dimensions = [
            "category" : "politics",    // What type of news is this?
            "dayType" : "weekday"     // Is it a weekday or the weekend?
        ]
        
        // Send the dimensions to Parse along with the 'read' event
        PFAnalytics.trackEvent("read", dimensions: dimensions)

        
        return true
    }
    

    func setupAppAppearance(){
        UITabBar.appearance().barTintColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1.0)
        UITabBar.appearance().tintColor = UIColor.blackColor()
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

