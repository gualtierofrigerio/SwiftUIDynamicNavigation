//
//  ViewFactory.swift
//  SwiftUIDynamicNavigation
//
//  Created by Gualtiero Frigerio on 27/02/21.
//

import SwiftUI

/// Provideds a static func to build a SwiftUI view for a specific AppState
class ViewFactory {
    static func viewForState(_ state:AppState, coordinator:Coordinator) -> some View {
        @ViewBuilder var renderedView: some View {
            if state == .start {
                StartView(coordinator:coordinator)
            }
            if state == .progress {
                Text("in progress...")
            }
            if state == .success {
                SuccessView(coordinator: coordinator)
            }
            else if state == .failure {
                ErrorView(coordinator: coordinator)
            }
        }
        return renderedView
    }
}
