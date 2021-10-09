//
//  AppDelegate.swift
//  LaunchDarklyFeatureFlagging
//
//  Created by River McCaine on 10/8/21.
//

import UIKit
import LaunchDarkly



@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private let mobileKey = "mob-648573d3-b60d-40b6-8fda-5ca43201aef7"
    
    private func setUpLDCClient() {
        let user = LDUser(key: "mccaine.river@gmail.com")
        
        var config = LDConfig(mobileKey: mobileKey)
        config.eventFlushInterval = 30.0
        LDClient.start(config: config, user: user)
    }
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setUpLDCClient()
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

