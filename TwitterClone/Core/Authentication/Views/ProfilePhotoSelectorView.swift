//
//  ProfilePhotoSelectorView.swift
//  TwitterClone
//
//  Created by admin on 8/9/22.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack{Spacer()}
                Text("Setup account.")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Add a profile photo")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .frame(height: 260)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(RoundedShape(corners: [.bottomRight]))
            
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        //.renderingMode(.template)
                        .frame(width: 180, height: 180)
                       // .padding()
                        .clipShape(Circle())
                }else {
                    Image(systemName: "plus")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 100, height: 100)
                        .padding()
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
            }
            
            .padding()
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            
            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .padding(.top, 24)
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
            }

            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else {
            return
        }
        profileImage = Image(uiImage: selectedImage)
    }
        
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
