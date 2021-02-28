//
//  AppState.swift
//  SwiftUIDynamicNavigation
//
//  Created by Gualtiero Frigerio on 27/02/21.
//

import Foundation

/// Enum describing the state of the app
/// the state is changed by a coordinator
/// after an action is executed
enum AppState {
    case start
    case progress
    case success
    case failure
}

