//
//  CurrentUserProfileView.swift
//  instaClone
//
//  Created by Wolf Trail on 18.08.2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: User

    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]

    var posts: [Post] {
        return Post.MOCK_POST.filter { $0.user?.username
            == user.username
        }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // Header
                    ProfileHeaderView(user: user)
                    // Posts
                    PostGridView(posts: Post.MOCK_POST)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(Color("buttonTextColor"))
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.MOCK_USER[0])
}
