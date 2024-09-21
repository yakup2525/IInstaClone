//
//  CreatePasswordVİew.swift
//  instaClone
//
//  Created by Wolf Trail on 18.08.2024.
//

import SwiftUI

struct CreatePasswordView: View {
    @Environment(\.dismiss) var dismis
    @EnvironmentObject var viewModel: RegisterViewModel

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                Text("Add your password")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color("buttonTextColor"))

                Text("You'll use this password to sign in to your account")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                SecureFieldWithButton("Enter your password", text: $viewModel.password)

                NavigationLink {
                    CompleteSignUpView()
                        .navigationBarBackButtonHidden()

                } label: {
                    Text("Next")
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
    CreatePasswordView()
        .environmentObject(RegisterViewModel())
}
