//
//  User.swift
//  instaClone
//
//  Created by Wolf Trail on 18.08.2024.
//

import FirebaseAuth
import Foundation

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    var email: String
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var MOCK_USER: [User] = [
        .init(id: UUID().uuidString, username: "wolf1", profileImageUrl: "wolf1",
              fullname: "wolf 1",
              bio: "wolf trail instagram native test",
              email: "wolf1@gmail.com"),
        .init(id: UUID().uuidString, username: "wolf2", profileImageUrl: "wolf2",
              fullname: "wolf 2",
              bio: "wolf trail instagram native test",
              email: "wolf2@gmail.com"),
        .init(id: UUID().uuidString, username: "wolf3", profileImageUrl: "wolf3",
              fullname: "wolf 3",
              bio: "wolf trail instagram native test",
              email: "wolf3@gmail.com"),
        .init(id: UUID().uuidString, username: "wolf4", profileImageUrl: "wolf4",
              fullname: "wolf 4",
              bio: "wolf trail instagram native test",
              email: "wolf4@gmail.com"),
        .init(id: UUID().uuidString, username: "wolf5", profileImageUrl: "wolf5",
              fullname: "wolf 5",
              bio: "wolf trail instagram native test",
              email: "wolf5@gmail.com"),
    ]
}
