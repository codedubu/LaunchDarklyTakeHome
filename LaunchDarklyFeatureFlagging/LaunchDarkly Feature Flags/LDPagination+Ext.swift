//
//  LDFollowerListVC+Ext.swift
//  LaunchDarklyFeatureFlagging
//
//  Created by River McCaine on 10/11/21.
//

import Foundation
import LaunchDarkly

extension NetworkManager {
    
    fileprivate struct featureFlag {
        static var paginationFeatureFlagKey: String = "change-followers-per-page"
    }
    var paginationFeatureFlagKey: String {
        get {
            return featureFlag.paginationFeatureFlagKey
        }
        set(featureFlagKey) {
            featureFlag.paginationFeatureFlagKey = featureFlagKey
        }
    }
    
    
    // MARK: - Feature Flag Helper Methods
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
    
    
    // MARK: - LaunchDarkly Helper Methods
    fileprivate func observePaginationFeatureFlagKey() {
        LDClient.get()?.observe(key: paginationFeatureFlagKey, owner: self) { [weak self] changedFlag in
            self?.featureFlagDidUpdate(changedFlag.key)
        }
    }
    

    fileprivate func checkPaginationFeatureValue() {
        let featureFlagValue = LDClient.get()!.variation(forKey: paginationFeatureFlagKey, defaultValue: "oneHundred")
        
        updatePaginationValue(targeted: featureFlagValue)
    }
    

    fileprivate func featureFlagDidUpdate(_ key: LDFlagKey) {
        if key == paginationFeatureFlagKey {
            checkPaginationFeatureValue()
        }
    }
} // END OF EXTENSION


extension FollowerListVC {
    
    func configureLDFeatureFlagOnMainThread() {
        DispatchQueue.main.async {
            NetworkManager.shared.observePaginationFeatureFlagKey()
            NetworkManager.shared.checkPaginationFeatureValue()
        }
    }
} // END OF EXTENSION
