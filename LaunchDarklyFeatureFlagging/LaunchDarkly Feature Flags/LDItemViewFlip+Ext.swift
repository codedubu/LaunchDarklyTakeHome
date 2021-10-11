//
//  LDItemViewFlip+Ext.swift
//  LaunchDarklyFeatureFlagging
//
//  Created by River McCaine on 10/11/21.
//

import UIKit
import LaunchDarkly

extension UserInfoVC {
    
    fileprivate struct featureFlag {
        
        static var itemViewFlipFeatureFlagKey: String = "user-info-vc-item-view-flipped"
    }
    var itemViewFlipFeatureFlagKey: String {
        get {
            return featureFlag.itemViewFlipFeatureFlagKey
        }
        set(featureFlagKey) {
            featureFlag.itemViewFlipFeatureFlagKey = featureFlagKey
        }
    }
    
    
    // MARK: - Feature Flag Helper Methods
    func configureUIElementsWithFeatureFlag(with user: User) {
        self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.headerView)
        self.add(childVC: GFRepoItemVC(user: user, delegate: self), to: self.itemViewTwo)
        self.add(childVC: GFFollowerItemVC(user: user, delegate: self), to: self.itemViewOne)
        self.dateLabel.text = "GitHub user since \(user.createdAt.convertToMonthYearFormat())"
    }
    
    
    // MARK: - LaunchDarkly Helper Methods
    fileprivate func observeItemVCFlipFeatureFlagKey() {
        LDClient.get()?.observe(key: itemViewFlipFeatureFlagKey, owner: self) { [weak self] changedFlag in
            self?.featureFlagDidUpdate(changedFlag.key)
        }
    }
    
    
    fileprivate func checkItemVCFlipFeatureValue() {
        let featureFlagValue = LDClient.get()!.variation(forKey: itemViewFlipFeatureFlagKey, defaultValue: false)
        guard let retrievedUser = retrievedUser else { return }
        
        featureFlagValue == false ? configureUIElements(with: retrievedUser) : configureUIElementsWithFeatureFlag(with: retrievedUser)
    }
    
    
    fileprivate func featureFlagDidUpdate(_ key: LDFlagKey) {
        if key == itemViewFlipFeatureFlagKey {
            checkItemVCFlipFeatureValue()
        }
    }
    
    
    func configureItemVCFlipLDFeatureFlag() {
        self.observeItemVCFlipFeatureFlagKey()
        self.checkItemVCFlipFeatureValue()
    }
} // END OF EXTENSION
