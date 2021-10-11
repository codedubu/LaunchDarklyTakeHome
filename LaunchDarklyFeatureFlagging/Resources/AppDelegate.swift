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
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
} // END OF CLASS

