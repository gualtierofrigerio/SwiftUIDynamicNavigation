//
//  ActionsHandler.swift
//  SwiftUIDynamicNavigation
//
//  Created by Gualtiero Frigerio on 06/03/21.
//

import Foundation

let mockActionsHandler = mockViewModel

/// actions supported by the Coordinator
enum Action {
    case cancelCall
    case makeCall
    case gotoStart
    case goBack
}

protocol ActionsHandler {
    func executeAction(_ action:Action)
}

