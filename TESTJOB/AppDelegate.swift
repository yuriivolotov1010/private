//
//  AppDelegate.swift
//  TESTJOB
//
//  Created by Admin on 14/02/2017.
//  Copyright © 2017 Hans. All rights reserved.
//

import UIKit
import GoogleMaps
import FBSDKCoreKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var deviceToken: String?
  
  let googleMapsApiKey = "AIzaSyC1o42NywJxoppJbX8tv5e2k2PAsmIj6rI"
  

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    // Google Map
    GMSServices.provideAPIKey(googleMapsApiKey)
    // Facebook
    // Facebook.
    FBSDKApplicationDelegate.sharedInstance().application(
      application, didFinishLaunchingWithOptions: launchOptions)
    
    return true
  }

  func application(_ application: UIApplication,
                   open url: URL,
                   options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
    // Facebook.
    return FBSDKApplicationDelegate.sharedInstance().application(
      application,
      open: url,
      options: options)
  }
  
  // Deprecated, but required to run on iOS 8 and older.
  func application(_ application: UIApplication,
                   open url: URL,
                   sourceApplication: String?,
                   annotation: Any) -> Bool {
    // Facebook.
    return FBSDKApplicationDelegate.sharedInstance().application(
      application,
      open: url,
      sourceApplication: sourceApplication,
      annotation: annotation)
  }
  
  func application(_ application: UIApplication,
                   didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    let deviceTokenStr = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
    self.deviceToken = deviceTokenStr
    
  }
  
  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

