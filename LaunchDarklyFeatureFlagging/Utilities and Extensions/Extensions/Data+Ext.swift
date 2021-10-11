//
//  Data+Ext.swift
//  LaunchDarklyFeatureFlagging
//
//  Created by River McCaine on 10/11/21.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
} // END OF EXTENSION

