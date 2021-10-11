//
//  Follower.swift
//  LaunchDarklyFeatureFlagging
//
//  Created by River McCaine on 10/10/21.
//

import Foundation

struct Follower: Codable {
    
    let uuid = UUID()
    var login: String
    var avatarUrl: String
} // END OF STRUCT


extension Follower: Hashable {
    
    static func ==(lhs: Follower, rhs: Follower) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}//END OF EXTENSION
