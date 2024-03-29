//
//  ContentView.swift
//  SwiftUIDynamicNavigation
//
//  Created by Gualtiero Frigerio on 27/02/21.
//

import SwiftUI

struct ContentView: View {
    var coordinator:Coordinator
    
    var body: some View {
        NavigationView {
            ContainerView(viewModel: coordinator.viewModel(forState: .start))
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coordinator:Coordinator())
    }
}
