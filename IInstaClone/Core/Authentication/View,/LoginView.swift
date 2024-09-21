//
//  LoginView.swift
//  instaClone
//
//  Created by Wolf Trail on 17.08.2024.
//

import SwiftUI

struct LoginView: View {
   
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationStack {
            Spacer()

            Image("instagram")
                .resizable()
                .scaledToFit()
                .frame(width: 220, height: 100)

            VStack(spacing: 12) {
                TextField("Enter your email", text: $viewModel.email)
                    .autocapitalization(/*@START_MENU_TOKEN@*/ .none/*@END_MENU_TOKEN@*/)
                    .modifier(IGTextFieldMidifier())

                SecureFieldWithButton("Enter your password", text: $viewModel.password)
            }

            Button {
                Task {
                    try await viewModel.signIn()
                }
                print("Login Button")

            } label: {
                Text("Login")
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
            .padding(.top, 12)

            Button {
                print("Forget Password?")
            } label: {
                Text("Forget Password?")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.top)
                    .padding(.trailing, 24)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)

            HStack {
                Rectangle()
                    .frame(height: 0.5)
                Text("Or")
                Rectangle()
                    .frame(height: 0.5)
            }
            .padding(.horizontal, 24)
            .foregroundStyle(.gray)

            HStack {
                Image("facebook")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("Continue with Facebook")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.systemBlue))
            }
            .padding(.top, 8)

            Spacer()
            Divider()
            NavigationLink {
                AddEmailView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                HStack {
                    Text("Don't have an account?")
                    Text("sign up")
                        .fontWeight(.semibold)
                }
            }
            .padding(.vertical, 16)
        }
    }
}

#Preview {
    LoginView()
}
