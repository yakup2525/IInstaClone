//
//  Post.swift
//  instaClone
//
//  Created by Wolf Trail on 21.08.2024.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    var user: User?
}

extension Post {
    static var MOCK_POST: [Post] = [
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Post Test caption for Feed, This is using for mock post",
            likes: 23,
            imageUrl: "wolf1",
            timestamp: Date(),
            user: User.MOCK_USER[0]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Post Test caption for Feed, This is using for mock post",
            likes: 23,
            imageUrl: "wolf2",
            timestamp: Date(),
            user: User.MOCK_USER[1]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Post Test caption for Feed, This is using for mock post",
            likes: 23,
            imageUrl: "wolf3",
            timestamp: Date(),
            user: User.MOCK_USER[2]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Post Test caption for Feed, This is using for mock post",
            likes: 23,
            imageUrl: "wolf4",
            timestamp: Date(),
            user: User.MOCK_USER[3]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Post Test caption for Feed, This is using for mock post",
            likes: 23,
            imageUrl: "wolf5",
            timestamp: Date(),
            user: User.MOCK_USER[4]
        ),
    ]
}
