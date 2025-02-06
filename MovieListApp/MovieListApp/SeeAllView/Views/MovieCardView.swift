//
//  MovieCardView.swift
//  MovieListApp
//
//  Created by Admin on 05/02/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieCardView: View {
    var body: some View {
        HStack(spacing: 20){
            WebImage(url: URL(string: "https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_.jpg"))
                .resizable()
                .frame(width: 80, height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 10){
                Text("Inception")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                HStack {
                    Text("2000")
                    Text("150 min")
                }
                .foregroundStyle(.gray)
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                    Text("9.0")
                        .foregroundStyle(.gray)
                }
            }
            
            Spacer()
            
            Image(systemName: "i.circle")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
        }
        .padding(.horizontal)
    }
}

#Preview {
    MovieCardView()
}
