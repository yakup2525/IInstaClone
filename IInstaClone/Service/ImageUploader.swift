//
//  ImageUploader.swift
//  instaClone
//
//  Created by Wolf Trail on 25.08.2024.
//

import Firebase
import FirebaseStorage
import Foundation

enum ImageUploader {
    static func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return nil }

        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(filename)")

        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("Dovnload Error: \(error.localizedDescription)")
            return nil
        }
    }
}
