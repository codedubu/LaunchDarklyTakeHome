//
//  GFError.swift
//  LaunchDarklyFeatureFlagging
//
//  Created by River McCaine on 10/11/21.
//

import Foundation

enum GFError: String, Error {
    
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case unableToFavorite = "There wasn error favoriting this user. Please try again."
    case alreadySavedToFavorites = "You already have this user on your favorites list!"
} // END OF ENUM
