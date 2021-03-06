//
//  ErrorView.swift
//  SwiftUIDynamicNavigation
//
//  Created by Gualtiero Frigerio on 27/02/21.
//

import SwiftUI

struct ErrorView: View {
    let actionsHandler:ActionsHandler
    
    var body: some View {
        Text("Error :(")
            .foregroundColor(.red)
        Button("Go back") {
            actionsHandler.executeAction(.goBack)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(actionsHandler: Coordinator())
    }
}
