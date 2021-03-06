//
//  ProgressView.swift
//  SwiftUIDynamicNavigation
//
//  Created by Gualtiero Frigerio on 06/03/21.
//

import SwiftUI

struct ProgressView: View {
    let actionsHandler:ActionsHandler
    
    var body: some View {
        Text("call in progress...")
        Button("cancel") {
            actionsHandler.executeAction(.cancelCall)
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(actionsHandler: mockActionsHandler)
    }
}
