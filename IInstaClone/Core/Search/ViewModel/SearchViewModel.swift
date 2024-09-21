//
//  SearchViewModel.swift
//  instaClone
//
//  Created by Wolf Trail on 24.08.2024.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User]()

    init() {
        Task { try await self.fetchAllUsers() }
    }

    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}
