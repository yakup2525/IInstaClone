//
//  SearchView.swift
//  instaClone
//
//  Created by Wolf Trail on 16.08.2024.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            HStack {
                                Image(user.profileImageUrl ?? "wolf3")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)

                                VStack(alignment: .leading) {
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(Color("buttonTextColor"))

                                    if let fullname = user.fullname {
                                        Text(fullname)
                                            .foregroundStyle(Color("buttonTextColor"))
                                            .font(.footnote)
                                    }
                                }
                                .font(.footnote)
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .searchable(text: $searchText, prompt: "Search...")
            }
            .navigationDestination(for: User.self, destination: {
                user in
                ProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
} //

#Preview {
    SearchView()
}
