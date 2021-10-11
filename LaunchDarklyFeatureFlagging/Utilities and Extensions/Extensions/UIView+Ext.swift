//
//  UIView+Ext.swift
//  LaunchDarklyFeatureFlagging
//
//  Created by River McCaine on 10/11/21.
//

import UIKit

extension UIView {
    
    func pinToEdges(of superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }
    
    
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
} // END OF EXTENSION
