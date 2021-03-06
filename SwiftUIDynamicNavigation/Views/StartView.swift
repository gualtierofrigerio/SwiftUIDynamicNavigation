//
//  StartView.swift
//  SwiftUIDynamicNavigation
//
//  Created by Gualtiero Frigerio on 27/02/21.
//

import SwiftUI

struct StartView: View {
    let actionsHandler:ActionsHandler
    
    var body: some View {
        Button("make call") {
            actionsHandler.executeAction(.makeCall)
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(actionsHandler: Coordinator())
    }
}
