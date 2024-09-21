//
//  ContentView.swift
//  instaClone
//
//  Created by Wolf Trail on 12.08.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registerViewModel = RegisterViewModel()
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
                    .environmentObject(registerViewModel)
            } else if let currentUser = viewModel.currentUser {
                MainTabView(user: currentUser)
            }
        }
    }
}

#Preview {
    ContentView()
}
