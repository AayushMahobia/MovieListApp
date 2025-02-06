//
//  CastView.swift
//  MovieListApp
//
//  Created by Admin on 05/02/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct CastView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            // Title
            Text("Top Cast")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            // Cards
            ScrollView(.horizontal){
                HStack(spacing: 16){
                    ForEach(0..<5){_ in
                        VStack {
                            WebImage(url: URL(string: "https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_.jpg"))
                                .resizable()
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                            Text("Actual Name")
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                            Text("Movie Name")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .padding(.leading)
        }
        .foregroundStyle(.white)
        .background(Color.black)
    }
}

#Preview {
    CastView()
}
