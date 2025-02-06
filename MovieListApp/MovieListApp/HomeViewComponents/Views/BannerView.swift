//
//  BannerView.swift
//  MovieListApp
//
//  Created by Admin on 05/02/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct BannerView: View {
    var body: some View {
        VStack {
            // Image
            WebImage(url: URL(string: "https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_.jpg"))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 460)
                .clipShape(Rectangle())
            
            // Buttons
            HStack(spacing: 12){
                Spacer()
                Button {
                    
                } label: {
                    Capsule()
                        .fill(Color(UIColor.darkGray))
                        .frame(width: 100, height: 35)
                        .overlay {
                            HStack{
                                Image(systemName: "play.fill")
                                Text("Play")
                            }
                        }
                }
                Button {
                    
                } label: {
                    Capsule()
                        .fill(.black)
                        .stroke(Color.white, lineWidth: 1)
                        .frame(width: 100, height: 35)
                        .overlay {
                            Text("Details")
                        }
                }
                Spacer()
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    BannerView()
}
