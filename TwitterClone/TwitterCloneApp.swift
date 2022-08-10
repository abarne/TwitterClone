//
//  TwitterCloneApp.swift
//  TwitterClone
//
//  Created by admin on 8/8/22.
//

import SwiftUI
import Firebase

@main
struct TwitterCloneApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
              //  ProfilePhotoSelectorView()
            }
            .environmentObject(viewModel)
            
        }
    }
}
