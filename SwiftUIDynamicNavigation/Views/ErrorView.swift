//
//  ErrorView.swift
//  SwiftUIDynamicNavigation
//
//  Created by Gualtiero Frigerio on 27/02/21.
//

import SwiftUI

struct ErrorView: View {
    let coordinator:Coordinator
    var body: some View {
        Text("Error :(")
            .foregroundColor(.red)
        Button("Goto home") {
            coordinator.executeAction(.gotoStart)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(coordinator: Coordinator())
    }
}
