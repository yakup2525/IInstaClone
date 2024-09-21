//
//  AddEmailView.swift
//  instaClone
//
//  Created by Wolf Trail on 17.08.2024.
//

import SwiftUI

struct AddEmailView: View {
    @Environment(\.dismiss) var dismis
    @EnvironmentObject var viewModel: RegisterViewModel
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                Text("Add your email")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color("buttonTextColor"))

                Text("You'll use this email to sign in to your account")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                TextField("Email", text: $viewModel.email)
                    .autocapitalization(/*@START_MENU_TOKEN@*/ .none/*@END_MENU_TOKEN@*/)
                    .modifier(IGTextFieldMidifier())

                NavigationLink {
                    CreateUserNameView()
                        .navigationBarBackButtonHidden(true)

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
    AddEmailView()
        .environmentObject(RegisterViewModel())
}
 
