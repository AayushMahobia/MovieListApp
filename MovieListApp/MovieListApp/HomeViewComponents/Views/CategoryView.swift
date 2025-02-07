//
//  CategoryView.swift
//  MovieListApp
//
//  Created by Admin on 05/02/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategoryView: View {
    
    let categoryData: Welcome
    let categoryName: String
    
    var body: some View {
        VStack{
            // Title
            HStack{
                Text(categoryName)
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                NavigationLink(value: CategoryModel(categoryData: categoryData, categoryName: categoryName)) {
                    Text("See All")
                        .foregroundStyle(.gray)
                }
            }
            .padding(.horizontal)
            
            // Cards
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<5){i in
                        NavigationLink(value: categoryData.results[i].id) {
                            WebImage(url: URL(string: categoryData.results[i].primaryImage ?? ""))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .padding(.leading)
        }
        .navigationDestination(for: CategoryModel.self, destination: { category in
            SeeAllView(category: category)
        })
        .navigationDestination(for: String.self) { movieId in
            MovieDetailsView(movieId: movieId)
        }
        .background(Color.black)
    }
}

//#Preview {
//    CategoryView(category: "Action")
//}
