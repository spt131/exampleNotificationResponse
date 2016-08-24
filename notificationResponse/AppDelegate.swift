//
//  AppDelegate.swift
//  notificationResponse
//
//  Created by Tubiello, Samuel on 8/23/16.
//  Copyright © 2016 Sam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Subscribe for notifications - assume the user chose yes for now
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil))
        
        return true
    }


    func applicationDidEnterBackground(application: UIApplication) {
        //Crete a local notification
        let notification = UILocalNotification()
        notification.alertBody = "This is a fake notification"
        notification.fireDate  = NSDate(timeIntervalSinceNow: 2)
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let otherVC = sb.instantiateViewControllerWithIdentifier("otherVC") as! OtherViewController
        window?.rootViewController = otherVC;
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        //Your code here
    }

}

