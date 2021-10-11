//
//  LDFollowerListVC+Ext.swift
//  LaunchDarklyFeatureFlagging
//
//  Created by River McCaine on 10/11/21.
//

import Foundation
import LaunchDarkly

extension NetworkManager {
    
    struct featureFlag {
        static var paginationFFKey: String = "change-followers-per-page"
    }
    var paginationFFKey: String {
        get {
            return featureFlag.paginationFFKey
        }
        set(featureFlagKey) {
            featureFlag.paginationFFKey = featureFlagKey
        }
    }
    
    
    fileprivate func observeFFKey() {
        LDClient.get()?.observe(key: paginationFFKey, owner: self) { [weak self] changedFlag in
            self?.featureFlagDidUpdate(changedFlag.key)
        }
    }
    

    fileprivate func checkFeatureValue() {
        let featureFlagValue = LDClient.get()!.variation(forKey: paginationFFKey, defaultValue: "oneHundred")
        
        updatePaginationValue(targeted: featureFlagValue)
    }
    

    fileprivate func featureFlagDidUpdate(_ key: LDFlagKey) {
        if key == paginationFFKey {
            checkFeatureValue()
        }
    }
    
    
    // MARK: - Helper Methods
    
    func updatePaginationValue(targeted variation: String) {
        switch variation {
        case "oneHundred":
            NetworkManager.followersPerPage = 100
        case "sixtyFive":
            NetworkManager.followersPerPage = 65
        case "thirty":
            NetworkManager.followersPerPage = 30
        default:
            NetworkManager.followersPerPage = 100
        }
    }
} // END OF EXTENSION


extension FollowerListVC {
    
    func configureLDFFOnMainThread() {
        DispatchQueue.main.async {
            NetworkManager.shared.observeFFKey()
            NetworkManager.shared.checkFeatureValue()
            
            self.presentGFAlertOnMainThread(title: "Feature Flag Notice", message: "Followers has been changed to \(NetworkManager.followersPerPage)", buttonTitle: "Ok")
        }
    }
} // END OF EXTENSION
