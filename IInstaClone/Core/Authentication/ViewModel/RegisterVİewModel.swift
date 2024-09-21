//
//  RegisterVİewModel.swift
//  instaClone
//
//  Created by Wolf Trail on 23.08.2024.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    func createUser() async throws {
        guard validate() else {
            return
        }
        
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        username = ""
        email = ""
        password = ""
        errorMessage = ""
    }
    
    func validate() -> Bool {
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter email"
            return false
        }
        
        guard !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter password"
            return false
        }

        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email"
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Please enter a password longer then 6 characters."
            return false
        }
        
        return true
    }
}
