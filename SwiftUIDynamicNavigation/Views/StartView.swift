//
//  StartView.swift
//  SwiftUIDynamicNavigation
//
//  Created by Gualtiero Frigerio on 27/02/21.
//

import SwiftUI

struct StartView: View {
    let coordinator:Coordinator
    @State var showProgress = false
    
    var body: some View {
        Button("make call") {
            showProgress = true
            coordinator.executeAction(.makeCall)
        }
        if showProgress {
            Text("call in progress...")
            Button("cancel") {
                coordinator.executeAction(.cancelCall)
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(coordinator: Coordinator())
    }
}
