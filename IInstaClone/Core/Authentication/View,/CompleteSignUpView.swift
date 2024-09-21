//
//  CompleteSignUpView.swift
//  instaClone
//
//  Created by Wolf Trail on 18.08.2024.
//

import SwiftUI

struct CompleteSignUpView: View {
    @Environment(\.dismiss) var dismis
    @EnvironmentObject var viewModel: RegisterViewModel

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                Text("Welcome to insta, \(viewModel.username)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color("buttonTextColor"))

                Text("Click below to complete registration and start using Insta")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)

                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .font(.footnote)
                        .foregroundStyle(.red)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)
                }

                Button {
                    // Main
                    Task { try await viewModel.createUser() }
                } label: {
                    Text("Complete sign up")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("buttonTextColor"))
                        .padding()
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                .overlay(RoundedRectangle(cornerRadius: 6)
                    .stroke(Color("buttonTextColor"),
                            lineWidth: 1)
                )
                .padding(.horizontal, 24)
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture {
                            dismis()
                        }
                }
            }
        }
    }
}

#Preview {
    CompleteSignUpView()
        .environmentObject(RegisterViewModel())
}
