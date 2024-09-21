//
//  UserService.swift
//  instaClone
//
//  Created by Wolf Trail on 24.08.2024.
//

import Firebase
import Foundation

enum UserService {
    @MainActor
    static func fetchAllUsers() async throws -> [User] {
        //  var users = [User]()
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()

        return snapshot.documents.compactMap { try? $0.data(as: User.self) }

        //  let documents = snapshot.documents
        //  for doc in documents {
        //     guard let user = try? doc.data(as: User.self) else { return users }
        //    users.append(user)
        // }
        //   return users
    }
}
