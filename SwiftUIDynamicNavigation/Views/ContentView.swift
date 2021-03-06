//
//  ContentView.swift
//  SwiftUIDynamicNavigation
//
//  Created by Gualtiero Frigerio on 27/02/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var coordinator:Coordinator
    
    var body: some View {
        NavigationView {
            ContainerView(viewModel: coordinator.nextViewModel())
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coordinator:Coordinator())
    }
}
