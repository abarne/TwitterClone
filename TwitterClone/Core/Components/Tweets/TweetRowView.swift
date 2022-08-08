//
//  TweetRowView.swift
//  TwitterClone
//
//  Created by admin on 8/8/22.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading){
            //profile image + user info + tweet
            HStack(alignment: .top, spacing: 12){
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(.blue)
                
                //user info and tweet caption
                VStack(alignment: .leading, spacing: 4){
                    HStack {
                        Text("Adam Barnett")
                            .font(.subheadline).bold()
                        Text("@Adam")
                            .font(.caption)
                        Text("2w")
                            .font(.caption)
                    }
                    
                    //tweet caption
                    
                    Text("This is the tweet caption")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                    
                }
            }
            
            //action buttons
            HStack{
                Button {
                    // action here
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                                        }
                Spacer()
                Button {
                    // action here
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    // action here
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    // action here
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }

            }
            

            .padding()
            .foregroundColor(.gray)
            Divider()
        }
        
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}
