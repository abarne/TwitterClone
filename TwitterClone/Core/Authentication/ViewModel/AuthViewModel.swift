//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by admin on 8/8/22.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseStorage

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthUser = false
    private var tempUserSession: FirebaseAuth.User?
    
    init(){
        self.userSession = Auth.auth().currentUser
    }
    
    func login(wiithEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if let error = error {
                print("DEBUG: failed to login error, \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: failed to register error, \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.tempUserSession = user
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthUser = true
                    print("DEBUG: did upload user data")
                }
        }
    }
    
    func signOut(){
        //sets usersession to nil so we show login view
        userSession = nil
        
        //signs user out on server
        try? Auth.auth().signOut()
    }
    
    func uploadProfileImage(_ image: UIImage){
        guard let uid = tempUserSession?.uid else { return }
        
        ImageUploader.uploadImage(image: image){ profileImageUrl in
            Firestore.firestore().collection("users").document(uid).updateData(["profileImageUrl": profileImageUrl]) { _ in
                print("uploaded image, setting userSession")
                self.userSession = self.tempUserSession
                
            }
        }
    }
}
