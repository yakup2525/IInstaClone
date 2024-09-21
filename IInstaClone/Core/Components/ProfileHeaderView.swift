//
//  ProfileHeaderVİew.swift
//  instaClone
//
//  Created by Wolf Trail on 22.08.2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    @State private var showEditProfile = false

    var body: some View {
        VStack(spacing: 10) {
            // Profile Card
            HStack {
                Image(user.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                Spacer()
                HStack(spacing: 8) {
                    UserStatView(value: 10, title: "Post")
                    UserStatView(value: 10, title: "Followers")
                    UserStatView(value: 10, title: "Following")
                }
            }
            .padding(.horizontal)
            // Name and description
            // Name and description
            VStack(alignment: .leading, spacing: 4) {
                if let fullname = user.fullname {
                    Text(fullname)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }

                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)

            // Edir Profile Button
            Button {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                } else {
                    print("Followed")
                }

            } label: {
                Text(user.isCurrentUser ?"Edit Profile" : "Follow").font(.subheadline)
                    .fontWeight(.bold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white : Color(.blue))
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .foregroundColor(Color("buttonTextColor"))
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6).stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1)
                    )
            }

            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile, content: {
            EditProfileView(user: user)
        })
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USER[0])
}
