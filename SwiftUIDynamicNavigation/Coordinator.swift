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
    case refresh
    case showSheet(Bool)
    case update(ViewState)
}

/// Coordinator class respnsible for mutating the AppState enum
/// and provide the correct view for the current state
class Coordinator:ObservableObject {
    @Published private (set) var state:AppState = .start
    @Published private (set) var nextAction:ViewAction = .none
    
    init() {
        currentViewModel = viewModel(forState: .start)
    }
    
    func nextViewModel() -> ContainerViewModel {
        let viewModel = ContainerViewModel(withCoordinator: self)
        if currentViewModel == nil {
            currentViewModel = viewModel
        }
        return viewModel
    }
    
    func viewModel(after viewModel:ContainerViewModel) -> ContainerViewModel {
        if let model = getViewModel(forState: .end) {
            return model
        }
        let viewModel = ContainerViewModel(withCoordinator: self)
        viewModels.append(ViewModelState(state:.end, viewModel: viewModel))
        return viewModel
    }
    
    func viewModel(forState state:AppState) -> ContainerViewModel {
        if let model = getViewModel(forState: state) {
            return model
        }
        let viewModel = ContainerViewModel(withCoordinator: self)
        viewModels.append(ViewModelState(state:state, viewModel: viewModel))
        return viewModel
    }
    
    private var currentViewModel:ContainerViewModel?
    private var viewModels:[ViewModelState] = []
    
    private func getViewModel(forState state:AppState) -> ContainerViewModel? {
        for model in viewModels {
            if model.state == state {
                return model.viewModel
            }
        }
        return nil
    }
    
    
    private func makeCall() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if let currentViewModel = self.currentViewModel {
                currentViewModel.executeViewAction(.enableLink)
            }
            let callSuccess = Bool.random()
            var nextViewState:ViewState
            if callSuccess {
                self.state = .success
                nextViewState = .success
            }
            else {
                self.state = .failure
                nextViewState = .failure
            }
            self.state = Bool.random() ? .success : .failure
            self.currentViewModel?.executeViewAction(.enableLink)
            self.currentViewModel?.executeViewAction(.update(.start))
            
            if let viewModel = self.getViewModel(forState: .end) {
                viewModel.executeViewAction(.update(nextViewState))
                self.currentViewModel = viewModel
            }
        }
    }
}

extension Coordinator:ActionsHandler {
    func executeAction(_ action:Action) {
        switch action {
        case .cancelCall:
            state = .failure
            nextAction = .refresh
            currentViewModel?.executeViewAction(.refresh)
        case .makeCall:
            state = .progress
            makeCall()
            currentViewModel?.executeViewAction(.update(.progress))
        case .gotoStart:
            state = .start
            nextAction = .refresh
            currentViewModel?.executeViewAction(.refresh)
        case .goBack:
            nextAction = .dismiss
            currentViewModel?.executeViewAction(.dismiss)
            currentViewModel = viewModel(forState: .start)
        }
    }
}

fileprivate struct ViewModelState {
    var state:AppState
    var viewModel:ContainerViewModel
}
