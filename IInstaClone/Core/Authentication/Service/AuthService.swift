//
//  AuthService.swift
//  instaClone
//
//  Created by Wolf Trail on 23.08.2024.
//

import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreCombineSwift
import Foundation

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?

    static let shared = AuthService()

    init() {
        Task { try await self.loadUserData() }
    }

    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await self.loadUserData()
        } catch {
            print("Error Logged In: \(error.localizedDescription)")
        }
    }

    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await self.uploadUserData(uid: result.user.uid, username: username, email: email)

        } catch {
            print("Error Register: \(error.localizedDescription)")
        }
    }

    func uploadUserData(uid: String, username: String, email: String) async {
        let user = User(id: uid, username: username, email: email)

        guard let encodedUser = try? Firestore.Encoder().encode(user) else {
            return
        }
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }

    @MainActor
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        guard let currentUid = self.userSession?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        self.currentUser = try? snapshot.data(as: User.self)
    }

    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
}
