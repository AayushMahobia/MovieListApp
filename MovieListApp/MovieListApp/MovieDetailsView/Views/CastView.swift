//
//  CastView.swift
//  MovieListApp
//
//  Created by Admin on 05/02/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct CastView: View {
    
    let movieDetails: Movie?
    
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
                    if let details = movieDetails, !details.cast.isEmpty {
                        ForEach(details.cast, id: \.self) { actor in
                            VStack {
                                Image(systemName: "person.fill")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .frame(width: 70, height: 70)
                                    .background(Color(UIColor.darkGray))
                                    .clipShape(Circle())
                                Text(actor.fullName?.prefix(12) ?? "")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                if let character = actor.characters?.first {
                                    Text(character.prefix(12))
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                }
                            }
                        }
                    } else {
                        Text("No Cast Available")
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

//#Preview {
//    CastView()
//}
