//
//  LoginViewModel.swift
//  instaClone
//
//  Created by Wolf Trail on 23.08.2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""

    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
