//
//  ViewController.swift
//  LaunchDarklyFeatureFlagging
//
//  Created by River McCaine on 10/8/21.
//

import UIKit
import LaunchDarkly

class MainTestVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var featureFlagTestLabel: UILabel!
    @IBOutlet weak var currentFlagStatusLabel: UILabel!
    
    // MARK: - Properties
    fileprivate let featureFlagKey = "change-text-of-test"
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LDClient.get()?.observe(key: featureFlagKey, owner: self) { [weak self] changedFlag in
            self?.featureFlagDidUpdate(changedFlag.key)
        }
        
        checkFeatureValue()
    }
    
    
    // MARK: - Helpers
    fileprivate func checkFeatureValue() {
        let featureFlagValue = LDClient.get()!.variation(forKey: featureFlagKey, defaultValue: false)
                
        featureFlagValue == false ? updateFlagLabels() : updateFlagLabels()
    }
    
    
    fileprivate func updateTestLabel(value:Bool) {
        if value == false {
            featureFlagTestLabel.text = "This label is currently in the default state."
        } else {
            featureFlagTestLabel.text = "LaunchDarkly's Feature Flag has been activated."
        }
    }
    

    fileprivate func updateCurrentFlagStatusLabel(value:Bool) {
        if value == false {
            currentFlagStatusLabel.text = "Current Flag Status: \n ❌ False ❌"
        } else {
            currentFlagStatusLabel.text = "Current Flag Status: \n ✅ True ✅"
        }
    }
    
    
    fileprivate func updateFlagLabels() {
        let featureFlagValue = LDClient.get()!.variation(forKey: featureFlagKey, defaultValue: false)
        
        updateTestLabel(value: featureFlagValue)
        updateCurrentFlagStatusLabel(value: featureFlagValue)
    }
 
    
    func featureFlagDidUpdate(_ key: LDFlagKey) {
        if key == featureFlagKey {
            checkFeatureValue()
        }
    }
    
} // END OF CLASS

