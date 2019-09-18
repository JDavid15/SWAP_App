//
//  AppDelegate.swift
//  SWAP
//
//  Created by Jonathan Torres on 5/16/17.
//  Copyright © 2017 Jonathan Torres. All rights reserved.
//

import UIKit
import WatchConnectivity

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    //Set the Session's Delegate and activete that session.
    var session: WCSession? {
        didSet{
            if let session = session{
                session.delegate = self
                session.activate()
            }
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if WCSession.isSupported() {
            session = WCSession.default()
        }
        
        return true
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

extension AppDelegate: WCSessionDelegate{
    
    //If the session ends for any reason
    func sessionDidDeactivate(_ session: WCSession) {
        print("Deactvivated")
        
    }
    
    //If the session is essentially idle
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("Became Inactive")
        
    }
    
    //Post call for the activate method. Check the error object for any potential connection issues.
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    //This is the main piece of concern in this class. Here we have recieved a message from the watch and will respond to it using the supplied replyHandler.
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        
        DispatchQueue.main.async {
            
            //Prepair data to send to the Watch
            NSKeyedArchiver.setClassName("Alarm", for: Alarms.self)
            //Create a dummy balance object to send over
            let alarmObjects: [Alarms] = []
            
            
            //Convert our Person object into a Data object using the archiver's archivedData method.
            let data = NSKeyedArchiver.archivedData(withRootObject: alarmObjects)
            //Respond to the watch with a dictionary containing this new data object which we'll unarchive on the other side.
            replyHandler(["sendAlarms": data])
            
        }
    }
}


