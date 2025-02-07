//
//  CategoryView.swift
//  MovieListApp
//
//  Created by Admin on 05/02/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategoryView: View {
    
    @Binding var isLoading: Bool
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
//                NavigationLink(value: "Action") {
                    Text("See All")
                        .foregroundStyle(.gray)
//                }
            }
            .padding(.horizontal)
            
            // Cards
            ScrollView(.horizontal) {
                HStack {
                    if isLoading {
                        placeHolders
                    } else{
                        ForEach(0..<5){i in
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
        .background(Color.black)
    }
    
    private var placeHolders: some View {
        ForEach(0..<5){i in
            Rectangle()
                .frame(width: 150, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .redactionShimmerViewModifier(isLoading: $isLoading)
        }
    }
}

//#Preview {
//    CategoryView(category: "Action")
//}
