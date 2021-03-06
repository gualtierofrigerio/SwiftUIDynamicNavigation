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
    
    init(withCoordinator coordinator:Coordinator) {
        self.coordinator = coordinator
        print("ContainerViewmodel created \(id)")
    }
    
    func currentView() -> some View {
        print("\(self) currentView called")
        return ViewFactory.viewForState(coordinator.state, coordinator: coordinator)
    }
    
    func executeViewAction(_ viewAction:ViewAction) {
        switch viewAction {
        case .enableLink:
            enableNavigationLink = true
        default:
            changesPublisher = viewAction
        }
            
        
    }
    
    func getChangesPublisher() -> AnyPublisher<ViewAction, Never> {
        $changesPublisher.eraseToAnyPublisher()
    }
    
    func nextView() -> some View {
        let viewModel = coordinator.nextViewModel()
        return ContainerView(viewModel: viewModel)
    }
    
    
    // MARK: - Private
    @Published private var changesPublisher:ViewAction = .none
    private var id = UUID()
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
