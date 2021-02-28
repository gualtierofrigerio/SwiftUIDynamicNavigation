//
//  SuccessView.swift
//  SwiftUIDynamicNavigation
//
//  Created by Gualtiero Frigerio on 27/02/21.
//

import SwiftUI

struct SuccessView: View {
    let coordinator:Coordinator
    
    var body: some View {
        Text("Success!")
        Button("Goto start") {
            coordinator.executeAction(.gotoStart)
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(coordinator: Coordinator())
    }
}
