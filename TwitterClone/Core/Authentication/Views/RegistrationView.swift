//
//  RegistrationView.swift
//  TwitterClone
//
//  Created by admin on 8/8/22.
//

import SwiftUI

struct RegistrationView: View {
    @State var email = ""
    @State var password = ""
    @State var userName = ""
    @State var fullName = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack{Spacer()}
                Text("Get started.")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Create your account")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .frame(height: 260)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(RoundedShape(corners: [.bottomRight]))
            
            VStack(spacing: 40){
                CustomInputField(imageName: "envelope", placeholderText: "Email...", isSecureField: false, text: $email)
                CustomInputField(imageName: "person", placeholderText: "Username...", isSecureField: false, text: $userName)
                CustomInputField(imageName: "person", placeholderText: "Full Name...", isSecureField: false, text: $fullName)
                CustomInputField(imageName: "lock", placeholderText: "Password...", isSecureField: true, text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            Button {
                viewModel.register(withEmail: email, password: password, fullname: fullName, username: userName)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .padding(.top, 24)
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)

            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack{
                    Text("Already have an account?")
                        .font(.footnote)
                    
                    Text("Sign in")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
            }
            
            .padding(.bottom, 32)
            
            
        }
        .ignoresSafeArea()
        .foregroundColor(Color(.systemBlue))
        .navigationBarHidden(true)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
