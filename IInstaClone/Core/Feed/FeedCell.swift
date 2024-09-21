//
//  FeedCell.swift
//  instaClone
//
//  Created by Wolf Trail on 16.08.2024.
//

import SwiftUI

struct FeedCell: View {
    let post: Post
    var body: some View {
        VStack {
            // Profile Picture and Name
            HStack {
                if let user = post.user {
                    Image(user.profileImageUrl ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color("buttonTextColor"))

                    Spacer()
                }
            }
            .padding(.leading, 8)

            // Post Image
            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            HStack {
                Button {}
                    label: {
                        Image(systemName: "heart")
                            .imageScale(.large)
                    }

                Button {}
                    label: {
                        Image(systemName: "bubble.right")
                            .imageScale(.large)
                    }
                Button {}
                    label: {
                        Image(systemName: "paperplane")
                            .imageScale(.large)
                    }
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundStyle(Color("buttonTextColor"))

            // Like Count
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            // Description

            HStack { Text("\(post.user?.username ?? "") ").fontWeight(.semibold)
                +
                Text(post.caption)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, alignment:
                .leading)
            .font(.footnote)
            .padding(.leading, 10)
            .padding(.top, 1)
            Text("10h ago")
                .font(.footnote)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, alignment:
                    .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    FeedCell(post: Post.MOCK_POST[0])
}
