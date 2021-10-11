//
//  UITableView.swift
//  LaunchDarklyFeatureFlagging
//
//  Created by River McCaine on 10/11/21.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
} // END OF EXTENSION
