//
//  MovieCardView.swift
//  MovieListApp
//
//  Created by Admin on 05/02/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieCardView: View {
    
    let movieData: Result
    
    var body: some View {
        HStack(spacing: 20){
            WebImage(url: URL(string: movieData.primaryImage ?? ""))
                .resizable()
                .frame(width: 80, height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 10){
                Text(movieData.primaryTitle?.prefix(18) ?? "")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                HStack {
                    Text(movieData.releaseDate?.prefix(4) ?? "")
                    Text("\(movieData.runtimeMinutes ?? 0) min")
                }
                .foregroundStyle(.gray)
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                    Text(String(format: "%.1f", movieData.averageRating ?? 0))
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

//#Preview {
//    MovieCardView()
//}
