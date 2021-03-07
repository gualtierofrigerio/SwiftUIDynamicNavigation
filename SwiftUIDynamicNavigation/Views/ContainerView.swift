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
            navigationLink()
        }.onReceive(viewModel.getViewActionPublisher()) { action in
            if case .dismiss = action {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    // MARK: - Private
    
    @State private var showSheet = false
    
    private func navigationLink() -> some View {
        let newContainer = viewModel.nextView()
        return NavigationLink(destination: newContainer, isActive: $viewModel.enableNavigationLink){}
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView(viewModel: mockViewModel)
    }
}
