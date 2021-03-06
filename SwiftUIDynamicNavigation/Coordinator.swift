//
//  Coordinator.swift
//  SwiftUIDynamicNavigation
//
//  Created by Gualtiero Frigerio on 27/02/21.
//

import Foundation
import Combine
import SwiftUI

enum ViewAction {
    case enableLink
    case dismiss
    case none
    case showSheet(Bool)
}

/// Coordinator class respnsible for mutating the AppState enum
/// and provide the correct view for the current state
class Coordinator:ObservableObject {
    @Published private (set) var state:AppState = .start
    
    func nextViewModel() -> ContainerViewModel {
        let viewModel = ContainerViewModel(withCoordinator: self)
        if currentViewModel == nil {
            currentViewModel = viewModel
        }
        return viewModel
    }
    
    @Published private var changesPublisher:ViewAction = .none
    private var currentViewModel:ContainerViewModel?
    private var viewModels:[ContainerViewModel] = []
    
    
    private func makeCall() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if let currentViewModel = self.currentViewModel {
                print("current view model execute enableLink")
                currentViewModel.executeViewAction(.enableLink)
            }
            self.state = .success
        }
    }
}

extension Coordinator:ActionsHandler {
    func executeAction(_ action:Action) {
        switch action {
        case .cancelCall:
            state = .failure
        case .makeCall:
            state = .progress
            makeCall()
        case .gotoStart:
            state = .start
        case .goBack:
            changesPublisher = .dismiss
        }
    }
}
