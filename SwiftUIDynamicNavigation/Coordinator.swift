//
//  Coordinator.swift
//  SwiftUIDynamicNavigation
//
//  Created by Gualtiero Frigerio on 27/02/21.
//

import Foundation
import SwiftUI

enum Action {
    case cancelCall
    case makeCall
    case gotoStart
}

class Coordinator:ObservableObject {
    @Published private (set) var state:AppState = .start
    
    func currentView() -> some View {
        ViewFactory.viewForState(state, coordinator: self)
    }
    
    func executeAction(_ action:Action) {
        switch action {
        case .cancelCall:
            state = .failure
        case .makeCall:
            state = .progress
            makeCall()
        case .gotoStart:
            state = .start
        }
    }
    
    private func makeCall() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.state = .success
        }
    }
}

class ViewPublisher:ObservableObject {
    
}
