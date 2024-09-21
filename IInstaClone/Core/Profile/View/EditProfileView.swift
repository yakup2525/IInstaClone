//
//  EditProfileView.swift
//  instaClone
//
//  Created by Wolf Trail on 24.08.2024.
//

import PhotosUI
import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismis

    @StateObject private var viewModel: EditProfileViewModel

    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }

    var body: some View {
        VStack {
            // Toolbar
            VStack {
                HStack {
                    Button("Cancel") {
                        dismis()
                    }
                    Spacer()
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Spacer()

                    Button("Done") {
                        Task {
                            try await viewModel.updateUserData()
                        }
                    }
                    .font(.subheadline)
                    .fontWeight(.bold)
                }
                .padding()
                Divider()
            }
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack {
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .foregroundStyle(.white)
                            .background(.gray)
                            .frame(width: 100, height: 100)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    } else {
                        Image(systemName: "person")
                            .resizable()
                            .foregroundStyle(.white)
                            .background(.gray)
                            .frame(width: 100, height: 100)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    }

                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Divider()
                }
            }
            .padding(.vertical, 8)

            VStack {
                EditProfileRowView(
                    title: "Name",
                    placeholder: "Enter your name",
                    text: $viewModel.fullname
                )
                EditProfileRowView(
                    title: "Bio",
                    placeholder: "Enter your bio",
                    text: $viewModel.bio
                )
            }
            Spacer()
        }
    }
}

#Preview {
    EditProfileView(user: User.MOCK_USER[0])
}
