//
//  TrailerView.swift
//  MovieListApp
//
//  Created by Admin on 05/02/25.
//

import SwiftUI

struct TrailerView: View {
    
    let movieDetails: Movie?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            // Screen
            Rectangle()
                .fill(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)))
                .frame(height: 270)
                .overlay {
                    VStack(spacing: 12) {
                        Image(systemName: "play.fill")
                            .font(.title)
                            .fontWeight(.semibold)
                        Text("Preview")
                    }
                }
            
            // Info
            VStack(alignment: .leading, spacing: 12){
                HStack{
                    Text(movieDetails?.primaryTitle ?? "")
                        .font(.title)
                        .fontWeight(.semibold)
                    Spacer()
                    HStack(spacing: 16){
                        Image(systemName: "plus")
                        Image(systemName: "icloud.and.arrow.down.fill")
                    }
                    .font(.title3)
                    .fontWeight(.semibold)
                }
                
                HStack(spacing: 16){
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                        Text(String(format: "%.1f", movieDetails?.averageRating ?? 0))
                    }
                    Group{
                        Text(movieDetails?.releaseDate.prefix(4) ?? "")
                        Text("\(movieDetails?.runtimeMinutes ?? 0) min")
                        Text(movieDetails?.contentRating ?? "")
                        Text("HD")
                    }
                    .foregroundStyle(.gray)
                }
                
                HStack(){
                    Image(systemName: "hand.thumbsup.circle.fill")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.red)
                    Text("Most Liked")
                }
            }
            .font(.headline)
            .padding(.horizontal)
            
            // Big Play button
            Button {
                
            } label: {
                Capsule()
                    .fill(Color(UIColor.darkGray))
                    .frame(height: 44)
                    .overlay {
                        HStack{
                            Image(systemName: "play.fill")
                            Text("Play")
                                .font(.headline)
                        }
                    }
                    .padding(.horizontal)
            }
        }
        .foregroundStyle(.white)
        .background(Color.black)
    }
}

//#Preview {
//    TrailerView()
//}
