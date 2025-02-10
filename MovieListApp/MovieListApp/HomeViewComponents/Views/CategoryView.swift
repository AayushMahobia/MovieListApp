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
    @EnvironmentObject var pathManager: NavigationPathManager
    
    var body: some View {
        VStack{
            // Title
            HStack{
                Text(categoryName)
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                Text("See All")
                    .foregroundStyle(.gray)
                    .onTapGesture {
                        let categoryModel = CategoryModel(categoryData: categoryData, categoryName: categoryName)
                        pathManager.path.append(categoryModel)
                    }
            }
            .padding(.horizontal)
            
            // Cards
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<5){i in
                        WebImage(url: URL(string: categoryData.results[i].primaryImage ?? ""))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .onTapGesture {
                                let id: String = categoryData.results[i].id ?? ""
                                pathManager.path.append(id)
                            }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .padding(.leading)
        }
        .background(Color.black)
    }
}

//#Preview {
//    CategoryView(category: "Action")
//}
