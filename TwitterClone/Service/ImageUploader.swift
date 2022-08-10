//
//  ImageUploader.swift
//  TwitterClone
//
//  Created by admin on 8/9/22.
//

import Firebase
import FirebaseStorage
import UIKit

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference().child("profile_image").child(filename)
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("failed to upload image with error: \(error.localizedDescription)")
                print(error)
                return
            }
            ref.downloadURL { imageUrl, _ in
                guard let imageUrl = imageUrl?.absoluteString else { return }
                completion(imageUrl)
            }
        }
        
        
    }
}
