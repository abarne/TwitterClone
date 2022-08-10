//
//  User.swift
//  TwitterClone
//
//  Created by admin on 8/10/22.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
