//
//  ContainerViewModel.swift
//  SwiftUIDynamicNavigation
//
//  Created by Gualtiero Frigerio on 06/03/21.
//

import Foundation
import Combine
import SwiftUI

let mockViewModel = ContainerViewModel(withCoordinator:Coordinator())

class ContainerViewModel: ObservableObject {
    let coordinator:Coordinator
    var enableNavigationLink = false
    @Published var viewAction:ViewAction = .none
    
    init(withCoordinator coordinator:Coordinator) {
        self.coordinator = coordinator
    }
    
    func currentView() -> some View {
        return ViewFactory.viewForState(viewState, coordinator: coordinator)
    }
    
    func executeViewAction(_ viewAction:ViewAction) {
        switch viewAction {
        case .enableLink:
            enableNavigationLink = true
        case .update(let newState):
            viewState = newState
            self.viewAction = viewAction
        default:
            self.viewAction = viewAction
        }
    }
    
    func getChangesPublisher() -> AnyPublisher<ViewAction, Never> {
        $viewAction.eraseToAnyPublisher()
    }
    
    func nextView() -> some View {
        let viewModel = coordinator.viewModel(after:self)
        return ContainerView(viewModel: viewModel)
    }
    
    
    // MARK: - Private
    private var id = UUID()
    private var viewState:ViewState = .start
}

extension ContainerViewModel: ActionsHandler {
    func executeAction(_ action: Action) {
        coordinator.executeAction(action)
    }
}

extension ContainerViewModel: CustomDebugStringConvertible {
    var debugDescription: String {
        "ContainerViewModel id \(id)"
    }
}
