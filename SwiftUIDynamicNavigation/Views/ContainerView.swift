//
//  ContainerView.swift
//  SwiftUIDynamicNavigation
//
//  Created by Gualtiero Frigerio on 06/03/21.
//

import SwiftUI

struct ContainerView: View {
    @ObservedObject var viewModel:ContainerViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            viewModel.currentView()
            if viewModel.enableNavigationLink {
                navigationLink()
            }
        }.onReceive(viewModel.getChangesPublisher()) { action in
            self.executeViewAction(action)
        }
    }
    
    // MARK: - Private
    
    @State private var showSheet = false
    
    private func executeViewAction(_ viewAction:ViewAction) {
        switch viewAction {
        case .enableLink:
            print("\(viewModel) executeViewAction enableLink")
        case .dismiss:
            self.presentationMode.wrappedValue.dismiss()
        case .none:
            ()
        case .showSheet(let show):
            self.showSheet = show
        }
    }
    
    private func navigationLink() -> some View {
        print("\(viewModel) navigation link viewmodel enable = \(viewModel.enableNavigationLink)")
        let newContainer = viewModel.nextView()
        return NavigationLink(destination: newContainer, isActive: $viewModel.enableNavigationLink){}
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView(viewModel: mockViewModel)
    }
}
