//
//  PostGridView.swift
//  instaClone
//
//  Created by Wolf Trail on 22.08.2024.
//

import SwiftUI

struct PostGridView: View {
    var posts: [Post]
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]
    
    private let imageDimensions: CGFloat =
        (UIScreen.main.bounds.width / 3) - 1
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(posts) {
                post in
                Image(post.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimensions,
                           height: imageDimensions)
                    .clipped()
            }
        }
    }
}

#Preview {
    PostGridView(posts: Post.MOCK_POST)
}
