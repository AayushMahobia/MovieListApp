//
//  CategoryView.swift
//  MovieListApp
//
//  Created by Admin on 05/02/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategoryView: View {
    
    let category: String
    
    var body: some View {
        VStack{
            // Title
            HStack{
                Text(category)
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                NavigationLink(value: "Action") {
                    Text("See All")
                        .foregroundStyle(.gray)
                }
            }
            .padding(.horizontal)
            
            // Cards
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<5){_ in
                        WebImage(url: URL(string: "https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_.jpg"))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
            .scrollIndicators(.hidden)
            .padding(.leading)
        }
        .background(Color.black)
    }
}

#Preview {
    CategoryView(category: "Action")
}
