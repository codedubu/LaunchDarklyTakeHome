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
    
    private let mobileTestKey = "mob-648573d3-b60d-40b6-8fda-5ca43201aef7"
    private let mobileProdKey =  "mob-c4291fc6-2174-490b-8d3a-e7bc92ad54dd"
    
    
    private func setUpLDCClient() {
        let user = LDUser(key: "mccaine.river@gmail.com")
        
        var config = LDConfig(mobileKey: mobileProdKey)
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
